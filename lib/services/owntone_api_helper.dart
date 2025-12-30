import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';

import '../models/owntone_models.dart';
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
  String getTrackUrl(int trackId) {
    final baseUrl = _finampUserHelper.currentUser!.baseUrl;
    return "$baseUrl/databases/1/items/$trackId.dat";
  }

  /// Get the URL for artwork
  String? getArtworkUrl(String? artworkPath) {
    if (artworkPath == null) return null;

    final baseUrl = _finampUserHelper.currentUser!.baseUrl;
    // OwnTone returns relative paths like "./artwork/item/123"
    // We need to clean up the "./" prefix
    final cleanPath =
        artworkPath.startsWith('./') ? artworkPath.substring(2) : artworkPath;

    return "$baseUrl/$cleanPath";
  }
}
