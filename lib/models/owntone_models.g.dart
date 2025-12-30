// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owntone_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OwnToneLibrary _$OwnToneLibraryFromJson(Map<String, dynamic> json) =>
    OwnToneLibrary(
      songs: (json['songs'] as num).toInt(),
      dbPlaytime: (json['db_playtime'] as num).toInt(),
      artists: (json['artists'] as num).toInt(),
      albums: (json['albums'] as num).toInt(),
      fileSize: (json['file_size'] as num?)?.toInt(),
      startedAt: json['started_at'] as String,
      updatedAt: json['updated_at'] as String,
      updating: json['updating'] as bool,
    );

Map<String, dynamic> _$OwnToneLibraryToJson(OwnToneLibrary instance) =>
    <String, dynamic>{
      'songs': instance.songs,
      'db_playtime': instance.dbPlaytime,
      'artists': instance.artists,
      'albums': instance.albums,
      'file_size': instance.fileSize,
      'started_at': instance.startedAt,
      'updated_at': instance.updatedAt,
      'updating': instance.updating,
    };

OwnToneArtist _$OwnToneArtistFromJson(Map<String, dynamic> json) =>
    OwnToneArtist(
      id: json['id'] as String,
      name: json['name'] as String,
      nameSort: json['name_sort'] as String,
      albumCount: (json['album_count'] as num).toInt(),
      trackCount: (json['track_count'] as num).toInt(),
      lengthMs: (json['length_ms'] as num).toInt(),
      timeAdded: json['time_added'] as String?,
      inProgress: json['in_progress'] as bool?,
      mediaKind: json['media_kind'] as String,
      dataKind: json['data_kind'] as String,
      uri: json['uri'] as String,
      artworkUrl: json['artwork_url'] as String?,
    );

Map<String, dynamic> _$OwnToneArtistToJson(OwnToneArtist instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'name_sort': instance.nameSort,
      'album_count': instance.albumCount,
      'track_count': instance.trackCount,
      'length_ms': instance.lengthMs,
      'time_added': instance.timeAdded,
      'in_progress': instance.inProgress,
      'media_kind': instance.mediaKind,
      'data_kind': instance.dataKind,
      'uri': instance.uri,
      'artwork_url': instance.artworkUrl,
    };

OwnToneAlbum _$OwnToneAlbumFromJson(Map<String, dynamic> json) => OwnToneAlbum(
      id: json['id'] as String,
      name: json['name'] as String,
      nameSort: json['name_sort'] as String,
      artist: json['artist'] as String,
      artistId: json['artist_id'] as String,
      trackCount: (json['track_count'] as num).toInt(),
      lengthMs: (json['length_ms'] as num).toInt(),
      timeAdded: json['time_added'] as String?,
      inProgress: json['in_progress'] as bool?,
      mediaKind: json['media_kind'] as String,
      dataKind: json['data_kind'] as String,
      dateReleased: json['date_released'] as String?,
      year: (json['year'] as num?)?.toInt(),
      uri: json['uri'] as String,
      artworkUrl: json['artwork_url'] as String?,
    );

Map<String, dynamic> _$OwnToneAlbumToJson(OwnToneAlbum instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'name_sort': instance.nameSort,
      'artist': instance.artist,
      'artist_id': instance.artistId,
      'track_count': instance.trackCount,
      'length_ms': instance.lengthMs,
      'time_added': instance.timeAdded,
      'in_progress': instance.inProgress,
      'media_kind': instance.mediaKind,
      'data_kind': instance.dataKind,
      'date_released': instance.dateReleased,
      'year': instance.year,
      'uri': instance.uri,
      'artwork_url': instance.artworkUrl,
    };

OwnToneTrack _$OwnToneTrackFromJson(Map<String, dynamic> json) => OwnToneTrack(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      titleSort: json['title_sort'] as String,
      artist: json['artist'] as String,
      artistSort: json['artist_sort'] as String,
      album: json['album'] as String,
      albumSort: json['album_sort'] as String,
      albumId: json['album_id'] as String,
      albumArtist: json['album_artist'] as String,
      albumArtistSort: json['album_artist_sort'] as String,
      albumArtistId: json['album_artist_id'] as String,
      genre: json['genre'] as String,
      year: (json['year'] as num).toInt(),
      trackNumber: (json['track_number'] as num).toInt(),
      discNumber: (json['disc_number'] as num).toInt(),
      lengthMs: (json['length_ms'] as num).toInt(),
      rating: (json['rating'] as num).toInt(),
      playCount: (json['play_count'] as num).toInt(),
      skipCount: (json['skip_count'] as num).toInt(),
      timePlayed: json['time_played'] as String?,
      timeAdded: json['time_added'] as String,
      dateReleased: json['date_released'] as String?,
      seekMs: (json['seek_ms'] as num).toInt(),
      type: json['type'] as String,
      samplerate: (json['samplerate'] as num).toInt(),
      bitrate: (json['bitrate'] as num).toInt(),
      channels: (json['channels'] as num).toInt(),
      usermark: (json['usermark'] as num).toInt(),
      mediaKind: json['media_kind'] as String,
      dataKind: json['data_kind'] as String,
      path: json['path'] as String,
      uri: json['uri'] as String,
      artworkUrl: json['artwork_url'] as String,
    );

Map<String, dynamic> _$OwnToneTrackToJson(OwnToneTrack instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'title_sort': instance.titleSort,
      'artist': instance.artist,
      'artist_sort': instance.artistSort,
      'album': instance.album,
      'album_sort': instance.albumSort,
      'album_id': instance.albumId,
      'album_artist': instance.albumArtist,
      'album_artist_sort': instance.albumArtistSort,
      'album_artist_id': instance.albumArtistId,
      'genre': instance.genre,
      'year': instance.year,
      'track_number': instance.trackNumber,
      'disc_number': instance.discNumber,
      'length_ms': instance.lengthMs,
      'rating': instance.rating,
      'play_count': instance.playCount,
      'skip_count': instance.skipCount,
      'time_played': instance.timePlayed,
      'time_added': instance.timeAdded,
      'date_released': instance.dateReleased,
      'seek_ms': instance.seekMs,
      'type': instance.type,
      'samplerate': instance.samplerate,
      'bitrate': instance.bitrate,
      'channels': instance.channels,
      'usermark': instance.usermark,
      'media_kind': instance.mediaKind,
      'data_kind': instance.dataKind,
      'path': instance.path,
      'uri': instance.uri,
      'artwork_url': instance.artworkUrl,
    };

OwnTonePlaylist _$OwnTonePlaylistFromJson(Map<String, dynamic> json) =>
    OwnTonePlaylist(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      path: json['path'] as String,
      parentId: json['parent_id'] as String,
      type: json['type'] as String,
      smartPlaylist: json['smart_playlist'] as bool,
      random: json['random'] as bool,
      folder: json['folder'] as bool,
      itemCount: (json['item_count'] as num).toInt(),
      streamCount: (json['stream_count'] as num).toInt(),
      uri: json['uri'] as String,
    );

Map<String, dynamic> _$OwnTonePlaylistToJson(OwnTonePlaylist instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'path': instance.path,
      'parent_id': instance.parentId,
      'type': instance.type,
      'smart_playlist': instance.smartPlaylist,
      'random': instance.random,
      'folder': instance.folder,
      'item_count': instance.itemCount,
      'stream_count': instance.streamCount,
      'uri': instance.uri,
    };

OwnToneArtistList _$OwnToneArtistListFromJson(Map<String, dynamic> json) =>
    OwnToneArtistList(
      items: (json['items'] as List<dynamic>)
          .map((e) => OwnToneArtist.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$OwnToneArtistListToJson(OwnToneArtistList instance) =>
    <String, dynamic>{
      'items': instance.items,
      'total': instance.total,
      'offset': instance.offset,
      'limit': instance.limit,
    };

OwnToneAlbumList _$OwnToneAlbumListFromJson(Map<String, dynamic> json) =>
    OwnToneAlbumList(
      items: (json['items'] as List<dynamic>)
          .map((e) => OwnToneAlbum.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$OwnToneAlbumListToJson(OwnToneAlbumList instance) =>
    <String, dynamic>{
      'items': instance.items,
      'total': instance.total,
      'offset': instance.offset,
      'limit': instance.limit,
    };

OwnToneTrackList _$OwnToneTrackListFromJson(Map<String, dynamic> json) =>
    OwnToneTrackList(
      items: (json['items'] as List<dynamic>)
          .map((e) => OwnToneTrack.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$OwnToneTrackListToJson(OwnToneTrackList instance) =>
    <String, dynamic>{
      'items': instance.items,
      'total': instance.total,
      'offset': instance.offset,
      'limit': instance.limit,
    };

OwnTonePlaylistList _$OwnTonePlaylistListFromJson(Map<String, dynamic> json) =>
    OwnTonePlaylistList(
      items: (json['items'] as List<dynamic>)
          .map((e) => OwnTonePlaylist.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$OwnTonePlaylistListToJson(
        OwnTonePlaylistList instance) =>
    <String, dynamic>{
      'items': instance.items,
      'total': instance.total,
      'offset': instance.offset,
      'limit': instance.limit,
    };
