import 'package:flutter/material.dart';
import 'package:fownamp/services/owntone_api_helper.dart';
import 'package:get_it/get_it.dart';

import '../../models/jellyfin_models.dart';
import '../../screens/artist_screen.dart';
import '../../services/finamp_settings_helper.dart';
import '../album_image.dart';
import '../error_snackbar.dart';

class ArtistListTile extends StatefulWidget {
  const ArtistListTile({
    Key? key,
    required this.item,
    this.index,
    this.parentId,
  }) : super(key: key);

  final BaseItemDto item;
  final int? index;
  final String? parentId;

  @override
  State<ArtistListTile> createState() => _ArtistListTileState();
}

class _ArtistListTileState extends State<ArtistListTile> {
  final _owntoneApiHelper = GetIt.instance<OwnToneApiHelper>();

  late BaseItemDto mutableItem = widget.item;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final listTile = ListTile(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ArtistScreen.routeName, arguments: mutableItem);
      },
      leading: AlbumImage(item: mutableItem),
      title: Text(
        mutableItem.name ?? "Unknown Name",
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: null,
      trailing: null,
    );

    return listTile;
  }
}
