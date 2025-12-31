import 'package:flutter/material.dart';
import 'package:fownamp/l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

import '../services/finamp_user_helper.dart';
import 'music_screen.dart';
import '../services/owntone_api_helper.dart';
import '../models/jellyfin_models.dart';
import '../components/error_snackbar.dart';

class ViewSelector extends StatefulWidget {
  const ViewSelector({Key? key}) : super(key: key);

  static const routeName = "/settings/views";

  @override
  State<ViewSelector> createState() => _ViewSelectorState();
}

class _ViewSelectorState extends State<ViewSelector> {
  final _ownToneApiHelper = GetIt.instance<OwnToneApiHelper>();
  final _finampUserHelper = GetIt.instance<FinampUserHelper>();
  late Future<List<BaseItemDto>> viewListFuture;

  @override
  void initState() {
    super.initState();
    // Create synthetic views for OwnTone
    viewListFuture = _createSyntheticViews();
  }

  /// Creates fake "views" that represent OwnTone's browsing categories
  /// This allows us to reuse Finamp's navigation structure
  Future<List<BaseItemDto>> _createSyntheticViews() async {
    try {
      // Verify we can connect to the server
      await _ownToneApiHelper.getLibrary();

      // Create a single "Music" view that represents the entire OwnTone library
      // We use a synthetic BaseItemDto to match what the rest of the app expects
      return [
        BaseItemDto(
          name: "Music",
          id: "owntone-music", // Synthetic ID
          collectionType: "music",
          type: "CollectionFolder",
        ),
      ];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BaseItemDto>>(
      future: viewListFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // Since OwnTone only has one unified library, automatically select it
          // and navigate directly to the music screen
          WidgetsBinding.instance.addPostFrameCallback((_) {
            try {
              _finampUserHelper.setCurrentUserViews(snapshot.data!);
              Navigator.of(context).pushNamedAndRemoveUntil(
                MusicScreen.routeName,
                (route) => false,
              );
            } catch (e) {
              errorSnackbar(e, context);
            }
          });

          // Show a loading indicator while navigating
          return Scaffold(
            appBar: AppBar(
              title: Text("Connecting to OwnTone"),
            ),
            body: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator.adaptive(),
                  SizedBox(height: 16),
                  Text("Loading your music library..."),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Connection Error"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    "Failed to connect to OwnTone",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      snapshot.error.toString(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        viewListFuture = _createSyntheticViews();
                      });
                    },
                    child: const Text("Retry"),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text("Connecting"),
            ),
            body: const Center(child: CircularProgressIndicator.adaptive()),
          );
        }
      },
    );
  }
}
