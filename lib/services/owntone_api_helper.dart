import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';

import '../models/owntone_models.dart';
import '../models/jellyfin_models.dart';
import 'finamp_user_helper.dart';
import 'owntone_api.dart';

class OwnToneApiHelper {
  final ownToneApi = OwnToneApi.create();
  final _logger = Logger("OwnToneApiHelper");

  Uri? baseUrlTemp;

  final _finampUserHelper = GetIt.instance<FinampUserHelper>();

  /// Get library information
  Future<OwnToneLibrary> getLibrary() async {
    final response = await ownToneApi.getLibrary();
    return OwnToneLibrary.fromJson(response.body as Map<String, dynamic>);
  }

  /// Generic method to get items - mimics Jellyfin's API structure
  /// This is the main compatibility layer that routes to appropriate OwnTone endpoints
  Future<List<BaseItemDto>?> getItems({
    BaseItemDto? parentItem,
    String? includeItemTypes,
    String? sortBy,
    String? sortOrder,
    String? searchTerm,
    String? filters,
    bool? isGenres,
    int? startIndex,
    int? limit,
  }) async {
    try {
      // Route to the appropriate OwnTone endpoint based on what's being requested

      _logger.info(
          "getItems called with: includeItemTypes=$includeItemTypes, parentItem.type=${parentItem?.type}, isGenres=$isGenres");

      // Handle genres
      if (isGenres == true) {
        final genres = await getGenres(
          offset: startIndex,
          limit: limit,
        );
        return genres.items.map((g) => g.toBaseItemDto()).toList();
      }

      // Handle artists
      if (includeItemTypes == "MusicArtist" ||
          parentItem?.type == "MusicArtist") {
        if (parentItem?.type == "MusicArtist") {
          // Getting albums for a specific artist
          final albums = await getArtistAlbums(
            parentItem!.id,
            offset: startIndex,
            limit: limit,
          );
          return albums.items.map((a) => a.toBaseItemDto()).toList();
        } else {
          // Getting all artists
          final artists = await getArtists(
            offset: startIndex,
            limit: limit,
          );
          return artists.items.map((a) => a.toBaseItemDto()).toList();
        }
      }

      // Handle albums
      if (includeItemTypes == "MusicAlbum" ||
          parentItem?.type == "MusicAlbum") {
        if (parentItem?.type == "MusicAlbum") {
          // Getting tracks for a specific album
          final tracks = await getAlbumTracks(
            parentItem!.id,
            offset: startIndex,
            limit: limit,
          );
          return tracks.items.map((t) => t.toBaseItemDto()).toList();
        } else {
          // Getting all albums
          final albums = await getAlbums(
            offset: startIndex,
            limit: limit,
          );
          return albums.items.map((a) => a.toBaseItemDto()).toList();
        }
      }

      // Handle playlists
      if (includeItemTypes == "Playlist" || parentItem?.type == "Playlist") {
        if (parentItem?.type == "Playlist") {
          // Getting tracks for a specific playlist
          final tracks = await getPlaylistTracks(
            int.parse(parentItem!.id),
            offset: startIndex,
            limit: limit,
          );
          return tracks.items.map((t) => t.toBaseItemDto()).toList();
        } else {
          // Getting all playlists
          final playlists = await getPlaylists(
            offset: startIndex,
            limit: limit,
          );
          return playlists.items.map((p) => p.toBaseItemDto()).toList();
        }
      }

      // Handle tracks/audio - when not tied to a specific parent
      if (includeItemTypes == "Audio") {
        // OwnTone doesn't have a "get all tracks" endpoint that makes sense
        // for the UI, so we'll return albums instead
        final albums = await getAlbums(
          offset: startIndex,
          limit: limit,
        );
        return albums.items.map((a) => a.toBaseItemDto()).toList();
      }

      // Default: return empty list for unsupported types
      _logger.warning(
          "Unsupported item type requested: $includeItemTypes with parent type ${parentItem?.type}");
      return [];
    } catch (e) {
      _logger.severe("Error in getItems: $e");
      rethrow;
    }
  }

  /// Get artists with pagination
  Future<OwnToneArtistList> getArtists({
    int? offset,
    int? limit,
  }) async {
    final response = await ownToneApi.getArtists(
      offset: offset,
      limit: limit,
    );
    return OwnToneArtistList.fromJson(response.body as Map<String, dynamic>);
  }

  /// Get a specific artist
  Future<OwnToneArtist> getArtist(String id) async {
    final response = await ownToneApi.getArtist(id: id);
    return OwnToneArtist.fromJson(response.body as Map<String, dynamic>);
  }

  /// Get artist's albums
  Future<OwnToneAlbumList> getArtistAlbums(
    String artistId, {
    int? offset,
    int? limit,
  }) async {
    final response = await ownToneApi.getArtistAlbums(
      id: artistId,
      offset: offset,
      limit: limit,
    );
    return OwnToneAlbumList.fromJson(response.body as Map<String, dynamic>);
  }

  /// Get albums with pagination
  Future<OwnToneAlbumList> getAlbums({
    int? offset,
    int? limit,
  }) async {
    final response = await ownToneApi.getAlbums(
      offset: offset,
      limit: limit,
    );
    return OwnToneAlbumList.fromJson(response.body as Map<String, dynamic>);
  }

  /// Get a specific album
  Future<OwnToneAlbum> getAlbum(String id) async {
    final response = await ownToneApi.getAlbum(id: id);
    return OwnToneAlbum.fromJson(response.body as Map<String, dynamic>);
  }

  /// Get album's tracks
  Future<OwnToneTrackList> getAlbumTracks(
    String albumId, {
    int? offset,
    int? limit,
  }) async {
    final response = await ownToneApi.getAlbumTracks(
      id: albumId,
      offset: offset,
      limit: limit,
    );
    return OwnToneTrackList.fromJson(response.body as Map<String, dynamic>);
  }

  /// Get a specific track by ID - returns as BaseItemDto for compatibility
  Future<BaseItemDto> getItemById(String itemId) async {
    // Try to parse as int for track lookup
    final trackId = int.tryParse(itemId);
    if (trackId != null) {
      final track = await getTrack(trackId);
      return track.toBaseItemDto();
    }

    // If not a track, might be an album or artist
    // For now, throw an error - we'll handle this case if needed
    throw Exception(
        "getItemById not yet implemented for non-track items: $itemId");
  }

  /// Get a specific track
  Future<OwnToneTrack> getTrack(int id) async {
    final response = await ownToneApi.getTrack(id: id);
    return OwnToneTrack.fromJson(response.body as Map<String, dynamic>);
  }

  /// Get playlists
  Future<OwnTonePlaylistList> getPlaylists({
    int? offset,
    int? limit,
  }) async {
    final response = await ownToneApi.getPlaylists(
      offset: offset,
      limit: limit,
    );
    return OwnTonePlaylistList.fromJson(response.body as Map<String, dynamic>);
  }

  /// Get playlist tracks
  Future<OwnToneTrackList> getPlaylistTracks(
    int playlistId, {
    int? offset,
    int? limit,
  }) async {
    final response = await ownToneApi.getPlaylistTracks(
      id: playlistId,
      offset: offset,
      limit: limit,
    );
    return OwnToneTrackList.fromJson(response.body as Map<String, dynamic>);
  }

  /// Get genres with pagination
  Future<OwnToneGenreList> getGenres({
    int? offset,
    int? limit,
  }) async {
    final response = await ownToneApi.getGenres(
      offset: offset,
      limit: limit,
    );
    return OwnToneGenreList.fromJson(response.body as Map<String, dynamic>);
  }

  /// Update track rating (0-100)
  Future<void> updateTrackRating(int trackId, int rating) async {
    await ownToneApi.updateTrack(
      id: trackId,
      rating: rating,
    );
  }

  /// Increment play count
  Future<void> incrementPlayCount(int trackId) async {
    await ownToneApi.updateTrack(
      id: trackId,
      playCount: "increment",
    );
  }

  /// Get the URL for streaming a track
  /// Takes either a track ID (int) or BaseItemDto and returns the streaming URL
  String getTrackUrl(dynamic trackIdOrItem) {
    final baseUrl = _finampUserHelper.currentUser!.baseUrl;

    // Handle both int IDs and BaseItemDto objects
    int trackId;
    if (trackIdOrItem is int) {
      trackId = trackIdOrItem;
    } else if (trackIdOrItem is BaseItemDto) {
      trackId = int.parse(trackIdOrItem.id);
    } else {
      throw Exception(
          "getTrackUrl expects int or BaseItemDto, got ${trackIdOrItem.runtimeType}");
    }

    return "$baseUrl/databases/1/items/$trackId.dat";
  }

  /// Get the URL for artwork from a BaseItemDto
  /// OwnTone returns relative paths like "./artwork/item/123"
  Uri? getImageUrl({
    required BaseItemDto item,
    int? maxWidth,
    int? maxHeight,
    int? quality,
    String? format,
  }) {
    // For OwnTone items, the artwork URL is stored in the imageBlurHashes
    // This is a hack but allows us to preserve the OwnTone artwork URL
    // through the Jellyfin model conversion

    final baseUrl = _finampUserHelper.currentUser!.baseUrl;

    // Try to construct artwork URL from the item ID
    // OwnTone artwork URLs are typically: /artwork/item/{id}
    if (item.type == "Audio") {
      // Tracks have artwork at /artwork/item/{track_id}
      return Uri.parse("$baseUrl/artwork/item/${item.id}");
    } else if (item.type == "MusicAlbum") {
      // Albums have artwork at a group URL - we'll use the album ID
      // This is a simplification; OwnTone actually uses group IDs
      return Uri.parse("$baseUrl/artwork/group/${item.id}");
    } else if (item.type == "MusicArtist") {
      // Artists have artwork at a group URL
      return Uri.parse("$baseUrl/artwork/group/${item.id}");
    }

    return null;
  }

  /// Get playback info - OwnTone doesn't need this like Jellyfin does
  /// Returns a simple MediaSourceInfo that points to the track URL
  Future<List<MediaSourceInfo>?> getPlaybackInfo(String itemId) async {
    final trackId = int.parse(itemId);
    final track = await getTrack(trackId);

    // Create a simple MediaSourceInfo that describes the track
    return [
      MediaSourceInfo(
        protocol: "File",
        type: "Default",
        isRemote: false,
        supportsTranscoding: false,
        supportsDirectStream: true,
        supportsDirectPlay: true,
        isInfiniteStream: false,
        requiresOpening: false,
        requiresClosing: false,
        requiresLooping: false,
        supportsProbing: true,
        mediaStreams: [
          MediaStream(
            codec: track.type,
            type: "Audio",
            index: 0,
            isInterlaced: false,
            bitRate: track.bitrate * 1000,
            channels: track.channels,
            sampleRate: track.samplerate,
            isDefault: true,
            isForced: false,
            isExternal: false,
            isTextSubtitleStream: false,
            supportsExternalStream: false,
          ),
        ],
        readAtNativeFramerate: false,
        ignoreDts: false,
        ignoreIndex: false,
        genPtsInput: false,
        id: itemId,
        path: track.path,
        container: track.type,
        bitrate: track.bitrate * 1000,
        runTimeTicks: track.lengthMs * 10000,
      )
    ];
  }

  /// Logout by removing the current user
  Future<void> logoutCurrentUser() async {
    final _finampUserHelper = GetIt.instance<FinampUserHelper>();
    final currentUserId = _finampUserHelper.currentUserId;
    if (currentUserId != null) {
      _finampUserHelper.removeUser(currentUserId);
    }
  }
}
