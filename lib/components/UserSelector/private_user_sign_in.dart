import 'package:flutter/material.dart';
import 'package:fownamp/l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

import '../../screens/logs_screen.dart';
import '../../screens/view_selector.dart';
import '../../services/owntone_api_helper.dart';
import '../../services/finamp_user_helper.dart';
import '../../models/finamp_models.dart';
import '../error_snackbar.dart';

class PrivateUserSignIn extends StatefulWidget {
  const PrivateUserSignIn({Key? key}) : super(key: key);

  @override
  State<PrivateUserSignIn> createState() => _PrivateUserSignInState();
}

class _PrivateUserSignInState extends State<PrivateUserSignIn> {
  bool isConnecting = false;

  String? baseUrl;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.url,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.serverUrl,
                      hintText: "http://192.168.1.13:3689",
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        color: Theme.of(context).iconTheme.color,
                        icon: const Icon(Icons.info),
                        onPressed: () => showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Text(
                              "Enter your OwnTone server URL. OwnTone runs on port 3689 by default.",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text(MaterialLocalizations.of(context)
                                    .okButtonLabel),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) async => await sendForm(),
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return AppLocalizations.of(context)!.emptyServerUrl;
                      }
                      if (!value!.trim().startsWith("http://") &&
                          !value.trim().startsWith("https://")) {
                        return AppLocalizations.of(context)!.urlStartWithHttps;
                      }
                      if (value.trim().endsWith("/")) {
                        return AppLocalizations.of(context)!.urlTrailingSlash;
                      }
                      return null;
                    },
                    onSaved: (newValue) => baseUrl = newValue,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed(LogsScreen.routeName),
                    child:
                        Text(AppLocalizations.of(context)!.logs.toUpperCase()),
                  ),
                  ElevatedButton(
                    onPressed:
                        isConnecting ? null : () async => await sendForm(),
                    child: Text(isConnecting
                        ? "CONNECTING..."
                        : AppLocalizations.of(context)!.next.toUpperCase()),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Connect to OwnTone server
  Future<void> connectToOwnTone({
    required String baseUrl,
    required BuildContext context,
  }) async {
    final ownToneApiHelper = GetIt.instance<OwnToneApiHelper>();
    final finampUserHelper = GetIt.instance<FinampUserHelper>();

    // Trim the base url in case the user accidentally added trailing whitespace
    baseUrl = baseUrl.trim();

    ownToneApiHelper.baseUrlTemp = Uri.parse(baseUrl);

    try {
      // Test the connection by getting library info
      final library = await ownToneApiHelper.getLibrary();

      // Connection successful! Create a minimal user
      final newUser = FinampUser(
        id: "owntone", // Fixed ID since OwnTone has no users
        baseUrl: baseUrl,
        accessToken: "", // No token needed for OwnTone
        serverId: "owntone-server",
        views: {},
      );

      await finampUserHelper.saveUser(newUser);

      if (!mounted) return;

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Connected to OwnTone! ${library.songs} songs, ${library.artists} artists",
          ),
        ),
      );

      Navigator.of(context).pushNamed(ViewSelector.routeName);
    } catch (e) {
      errorSnackbar(e, context);
      return;
    }
  }

  Future<void> sendForm() async {
    if (formKey.currentState?.validate() == true) {
      formKey.currentState!.save();
      setState(() {
        isConnecting = true;
      });
      await connectToOwnTone(
        baseUrl: baseUrl!,
        context: context,
      );
      setState(() {
        isConnecting = false;
      });
    }
  }
}
