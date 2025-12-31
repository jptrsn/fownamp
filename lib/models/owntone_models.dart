import 'package:json_annotation/json_annotation.dart';
import 'jellyfin_models.dart';

part 'owntone_models.g.dart';

/// Library information
@JsonSerializable()
class OwnToneLibrary {
  final int songs;
  @JsonKey(name: 'db_playtime')
  final int dbPlaytime;
  final int artists;
  final int albums;
  @JsonKey(name: 'file_size')
  final int? fileSize;
  @JsonKey(name: 'started_at')
  final String startedAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  final bool updating;

  OwnToneLibrary({
    required this.songs,
    required this.dbPlaytime,
    required this.artists,
    required this.albums,
    this.fileSize,
    required this.startedAt,
    required this.updatedAt,
    required this.updating,
  });

  factory OwnToneLibrary.fromJson(Map<String, dynamic> json) =>
      _$OwnToneLibraryFromJson(json);
  Map<String, dynamic> toJson() => _$OwnToneLibraryToJson(this);
}

/// Artist object
@JsonSerializable()
class OwnToneArtist {
  final String id;
  final String name;
  @JsonKey(name: 'name_sort')
  final String nameSort;
  @JsonKey(name: 'album_count')
  final int albumCount;
  @JsonKey(name: 'track_count')
  final int trackCount;
  @JsonKey(name: 'length_ms')
  final int lengthMs;
  @JsonKey(name: 'time_added')
  final String? timeAdded;
  @JsonKey(name: 'in_progress')
  final bool? inProgress;
  @JsonKey(name: 'media_kind')
  final String mediaKind;
  @JsonKey(name: 'data_kind')
  final String dataKind;
  final String uri;
  @JsonKey(name: 'artwork_url')
  final String? artworkUrl;

  OwnToneArtist({
    required this.id,
    required this.name,
    required this.nameSort,
    required this.albumCount,
    required this.trackCount,
    required this.lengthMs,
    this.timeAdded,
    this.inProgress,
    required this.mediaKind,
    required this.dataKind,
    required this.uri,
    this.artworkUrl,
  });

  factory OwnToneArtist.fromJson(Map<String, dynamic> json) =>
      _$OwnToneArtistFromJson(json);
  Map<String, dynamic> toJson() => _$OwnToneArtistToJson(this);
}

/// Album object
@JsonSerializable()
class OwnToneAlbum {
  final String id;
  final String name;
  @JsonKey(name: 'name_sort')
  final String nameSort;
  final String artist;
  @JsonKey(name: 'artist_id')
  final String artistId;
  @JsonKey(name: 'track_count')
  final int trackCount;
  @JsonKey(name: 'length_ms')
  final int lengthMs;
  @JsonKey(name: 'time_added')
  final String? timeAdded;
  @JsonKey(name: 'in_progress')
  final bool? inProgress;
  @JsonKey(name: 'media_kind')
  final String mediaKind;
  @JsonKey(name: 'data_kind')
  final String dataKind;
  @JsonKey(name: 'date_released')
  final String? dateReleased;
  final int? year;
  final String uri;
  @JsonKey(name: 'artwork_url')
  final String? artworkUrl;

  OwnToneAlbum({
    required this.id,
    required this.name,
    required this.nameSort,
    required this.artist,
    required this.artistId,
    required this.trackCount,
    required this.lengthMs,
    this.timeAdded,
    this.inProgress,
    required this.mediaKind,
    required this.dataKind,
    this.dateReleased,
    this.year,
    required this.uri,
    this.artworkUrl,
  });

  factory OwnToneAlbum.fromJson(Map<String, dynamic> json) =>
      _$OwnToneAlbumFromJson(json);
  Map<String, dynamic> toJson() => _$OwnToneAlbumToJson(this);
}

/// Track object
@JsonSerializable()
class OwnToneTrack {
  final int id;
  final String title;
  @JsonKey(name: 'title_sort')
  final String titleSort;
  final String artist;
  @JsonKey(name: 'artist_sort')
  final String artistSort;
  final String album;
  @JsonKey(name: 'album_sort')
  final String albumSort;
  @JsonKey(name: 'album_id')
  final String albumId;
  @JsonKey(name: 'album_artist')
  final String albumArtist;
  @JsonKey(name: 'album_artist_sort')
  final String albumArtistSort;
  @JsonKey(name: 'album_artist_id')
  final String albumArtistId;
  final String genre;
  final int year;
  @JsonKey(name: 'track_number')
  final int trackNumber;
  @JsonKey(name: 'disc_number')
  final int discNumber;
  @JsonKey(name: 'length_ms')
  final int lengthMs;
  final int rating;
  @JsonKey(name: 'play_count')
  final int playCount;
  @JsonKey(name: 'skip_count')
  final int skipCount;
  @JsonKey(name: 'time_played')
  final String? timePlayed;
  @JsonKey(name: 'time_added')
  final String timeAdded;
  @JsonKey(name: 'date_released')
  final String? dateReleased;
  @JsonKey(name: 'seek_ms')
  final int seekMs;
  final String type;
  final int samplerate;
  final int bitrate;
  final int channels;
  final int usermark;
  @JsonKey(name: 'media_kind')
  final String mediaKind;
  @JsonKey(name: 'data_kind')
  final String dataKind;
  final String path;
  final String uri;
  @JsonKey(name: 'artwork_url')
  final String artworkUrl;

  OwnToneTrack({
    required this.id,
    required this.title,
    required this.titleSort,
    required this.artist,
    required this.artistSort,
    required this.album,
    required this.albumSort,
    required this.albumId,
    required this.albumArtist,
    required this.albumArtistSort,
    required this.albumArtistId,
    required this.genre,
    required this.year,
    required this.trackNumber,
    required this.discNumber,
    required this.lengthMs,
    required this.rating,
    required this.playCount,
    required this.skipCount,
    this.timePlayed,
    required this.timeAdded,
    this.dateReleased,
    required this.seekMs,
    required this.type,
    required this.samplerate,
    required this.bitrate,
    required this.channels,
    required this.usermark,
    required this.mediaKind,
    required this.dataKind,
    required this.path,
    required this.uri,
    required this.artworkUrl,
  });

  factory OwnToneTrack.fromJson(Map<String, dynamic> json) =>
      _$OwnToneTrackFromJson(json);
  Map<String, dynamic> toJson() => _$OwnToneTrackToJson(this);
}

/// Playlist object
@JsonSerializable()
class OwnTonePlaylist {
  final int id;
  final String name;
  final String path;
  @JsonKey(name: 'parent_id')
  final String parentId;
  final String type;
  @JsonKey(name: 'smart_playlist')
  final bool smartPlaylist;
  final bool random;
  final bool folder;
  @JsonKey(name: 'item_count')
  final int itemCount;
  @JsonKey(name: 'stream_count')
  final int streamCount;
  final String uri;

  OwnTonePlaylist({
    required this.id,
    required this.name,
    required this.path,
    required this.parentId,
    required this.type,
    required this.smartPlaylist,
    required this.random,
    required this.folder,
    required this.itemCount,
    required this.streamCount,
    required this.uri,
  });

  factory OwnTonePlaylist.fromJson(Map<String, dynamic> json) =>
      _$OwnTonePlaylistFromJson(json);
  Map<String, dynamic> toJson() => _$OwnTonePlaylistToJson(this);
}

/// Artists list wrapper
@JsonSerializable()
class OwnToneArtistList {
  final List<OwnToneArtist> items;
  final int total;
  final int offset;
  final int limit;

  OwnToneArtistList({
    required this.items,
    required this.total,
    required this.offset,
    required this.limit,
  });

  factory OwnToneArtistList.fromJson(Map<String, dynamic> json) =>
      _$OwnToneArtistListFromJson(json);
  Map<String, dynamic> toJson() => _$OwnToneArtistListToJson(this);
}

/// Albums list wrapper
@JsonSerializable()
class OwnToneAlbumList {
  final List<OwnToneAlbum> items;
  final int total;
  final int offset;
  final int limit;

  OwnToneAlbumList({
    required this.items,
    required this.total,
    required this.offset,
    required this.limit,
  });

  factory OwnToneAlbumList.fromJson(Map<String, dynamic> json) =>
      _$OwnToneAlbumListFromJson(json);
  Map<String, dynamic> toJson() => _$OwnToneAlbumListToJson(this);
}

/// Tracks list wrapper
@JsonSerializable()
class OwnToneTrackList {
  final List<OwnToneTrack> items;
  final int total;
  final int offset;
  final int limit;

  OwnToneTrackList({
    required this.items,
    required this.total,
    required this.offset,
    required this.limit,
  });

  factory OwnToneTrackList.fromJson(Map<String, dynamic> json) =>
      _$OwnToneTrackListFromJson(json);
  Map<String, dynamic> toJson() => _$OwnToneTrackListToJson(this);
}

/// Playlists list wrapper
@JsonSerializable()
class OwnTonePlaylistList {
  final List<OwnTonePlaylist> items;
  final int total;
  final int offset;
  final int limit;

  OwnTonePlaylistList({
    required this.items,
    required this.total,
    required this.offset,
    required this.limit,
  });

  factory OwnTonePlaylistList.fromJson(Map<String, dynamic> json) =>
      _$OwnTonePlaylistListFromJson(json);
  Map<String, dynamic> toJson() => _$OwnTonePlaylistListToJson(this);
}

/// Genre object - OwnTone genres only have a name
@JsonSerializable()
class OwnToneGenre {
  final String name;

  OwnToneGenre({
    required this.name,
  });

  factory OwnToneGenre.fromJson(Map<String, dynamic> json) =>
      _$OwnToneGenreFromJson(json);
  Map<String, dynamic> toJson() => _$OwnToneGenreToJson(this);
}

/// Genres list wrapper
@JsonSerializable()
class OwnToneGenreList {
  final List<OwnToneGenre> items;
  final int total;
  final int offset;
  final int limit;

  OwnToneGenreList({
    required this.items,
    required this.total,
    required this.offset,
    required this.limit,
  });

  factory OwnToneGenreList.fromJson(Map<String, dynamic> json) =>
      _$OwnToneGenreListFromJson(json);
  Map<String, dynamic> toJson() => _$OwnToneGenreListToJson(this);
}

extension OwnToneArtistExtension on OwnToneArtist {
  /// Convert OwnTone artist to Jellyfin BaseItemDto format
  /// This allows the existing UI to work without changes
  BaseItemDto toBaseItemDto() {
    return BaseItemDto(
      id: id,
      name: name,
      sortName: nameSort,
      type: "MusicArtist",
      albumCount: albumCount,
      userData: UserItemDataDto(
        playbackPositionTicks: 0,
        playCount: 0,
        isFavorite: false,
        played: false,
      ),
      imageBlurHashes: artworkUrl != null ? ImageBlurHashes() : null,
    );
  }
}

extension OwnToneAlbumExtension on OwnToneAlbum {
  /// Convert OwnTone album to Jellyfin BaseItemDto format
  BaseItemDto toBaseItemDto() {
    return BaseItemDto(
      id: id,
      name: name,
      sortName: nameSort,
      type: "MusicAlbum",
      albumArtist: artist,
      albumArtists: [NameIdPair(name: artist, id: artistId)],
      productionYear: year,
      childCount: trackCount,
      userData: UserItemDataDto(
        playbackPositionTicks: 0,
        playCount: 0,
        isFavorite: false,
        played: false,
      ),
      imageBlurHashes: artworkUrl != null ? ImageBlurHashes() : null,
    );
  }
}

extension OwnToneTrackExtension on OwnToneTrack {
  /// Convert OwnTone track to Jellyfin BaseItemDto format
  BaseItemDto toBaseItemDto() {
    return BaseItemDto(
      id: id.toString(), // OwnTone uses int IDs for tracks
      name: title,
      sortName: titleSort,
      type: "Audio",
      album: album,
      albumId: albumId,
      albumArtist: albumArtist,
      albumArtists: [NameIdPair(name: albumArtist, id: albumArtistId)],
      artists: [artist],
      artistItems: [NameIdPair(name: artist, id: albumArtistId)],
      indexNumber: trackNumber,
      parentIndexNumber: discNumber,
      productionYear: year,
      runTimeTicks: lengthMs * 10000, // Convert ms to ticks (1 tick = 100ns)
      userData: UserItemDataDto(
        playbackPositionTicks: seekMs * 10000,
        playCount: playCount,
        isFavorite: rating > 0,
        played: playCount > 0,
      ),
      imageBlurHashes: ImageBlurHashes(),
      genres: [genre],
      path: path,
    );
  }
}

extension OwnTonePlaylistExtension on OwnTonePlaylist {
  /// Convert OwnTone playlist to Jellyfin BaseItemDto format
  BaseItemDto toBaseItemDto() {
    return BaseItemDto(
      id: id.toString(),
      name: name,
      type: "Playlist",
      childCount: itemCount,
      userData: UserItemDataDto(
        playbackPositionTicks: 0,
        playCount: 0,
        isFavorite: false,
        played: false,
      ),
    );
  }
}

extension OwnToneGenreExtension on OwnToneGenre {
  /// Convert OwnTone genre to Jellyfin BaseItemDto format
  BaseItemDto toBaseItemDto() {
    return BaseItemDto(
      // OwnTone genres don't have IDs, so we'll use the name as the ID
      // This is safe because genre names are unique
      id: name,
      name: name,
      type: "MusicGenre",
      userData: UserItemDataDto(
        playbackPositionTicks: 0,
        playCount: 0,
        isFavorite: false,
        played: false,
      ),
    );
  }
}
