// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owntone_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$OwnToneApi extends OwnToneApi {
  _$OwnToneApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = OwnToneApi;

  @override
  Future<Response<dynamic>> getLibrary() {
    final Uri $url = Uri.parse('/api/library');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>(
      $request,
      requestConverter: JsonConverter.requestFactory,
      responseConverter: JsonConverter.responseFactory,
    );
  }

  @override
  Future<Response<dynamic>> getArtists({
    int? offset,
    int? limit,
  }) {
    final Uri $url = Uri.parse('/api/library/artists');
    final Map<String, dynamic> $params = <String, dynamic>{
      'offset': offset,
      'limit': limit,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>(
      $request,
      requestConverter: JsonConverter.requestFactory,
      responseConverter: JsonConverter.responseFactory,
    );
  }

  @override
  Future<Response<dynamic>> getArtist({required String id}) {
    final Uri $url = Uri.parse('/api/library/artists/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>(
      $request,
      requestConverter: JsonConverter.requestFactory,
      responseConverter: JsonConverter.responseFactory,
    );
  }

  @override
  Future<Response<OwnToneAlbumList>> getArtistAlbums({
    required String id,
    int? offset,
    int? limit,
  }) {
    final Uri $url = Uri.parse('/api/library/artists/${id}/albums');
    final Map<String, dynamic> $params = <String, dynamic>{
      'offset': offset,
      'limit': limit,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<OwnToneAlbumList, OwnToneAlbumList>(
      $request,
      requestConverter: JsonConverter.requestFactory,
      responseConverter: JsonConverter.responseFactory,
    );
  }

  @override
  Future<Response<dynamic>> getAlbums({
    int? offset,
    int? limit,
  }) {
    final Uri $url = Uri.parse('/api/library/albums');
    final Map<String, dynamic> $params = <String, dynamic>{
      'offset': offset,
      'limit': limit,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>(
      $request,
      requestConverter: JsonConverter.requestFactory,
      responseConverter: JsonConverter.responseFactory,
    );
  }

  @override
  Future<Response<OwnToneAlbum>> getAlbum({required String id}) {
    final Uri $url = Uri.parse('/api/library/albums/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<OwnToneAlbum, OwnToneAlbum>(
      $request,
      requestConverter: JsonConverter.requestFactory,
      responseConverter: JsonConverter.responseFactory,
    );
  }

  @override
  Future<Response<dynamic>> getAlbumTracks({
    required String id,
    int? offset,
    int? limit,
  }) {
    final Uri $url = Uri.parse('/api/library/albums/${id}/tracks');
    final Map<String, dynamic> $params = <String, dynamic>{
      'offset': offset,
      'limit': limit,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>(
      $request,
      requestConverter: JsonConverter.requestFactory,
      responseConverter: JsonConverter.responseFactory,
    );
  }

  @override
  Future<Response<dynamic>> getTrack({required int id}) {
    final Uri $url = Uri.parse('/api/library/tracks/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>(
      $request,
      requestConverter: JsonConverter.requestFactory,
      responseConverter: JsonConverter.responseFactory,
    );
  }

  @override
  Future<Response<dynamic>> getPlaylists({
    int? offset,
    int? limit,
  }) {
    final Uri $url = Uri.parse('/api/library/playlists');
    final Map<String, dynamic> $params = <String, dynamic>{
      'offset': offset,
      'limit': limit,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>(
      $request,
      requestConverter: JsonConverter.requestFactory,
      responseConverter: JsonConverter.responseFactory,
    );
  }

  @override
  Future<Response<dynamic>> getPlaylist({required int id}) {
    final Uri $url = Uri.parse('/api/library/playlists/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>(
      $request,
      requestConverter: JsonConverter.requestFactory,
      responseConverter: JsonConverter.responseFactory,
    );
  }

  @override
  Future<Response<dynamic>> getPlaylistTracks({
    required int id,
    int? offset,
    int? limit,
  }) {
    final Uri $url = Uri.parse('/api/library/playlists/${id}/tracks');
    final Map<String, dynamic> $params = <String, dynamic>{
      'offset': offset,
      'limit': limit,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>(
      $request,
      requestConverter: JsonConverter.requestFactory,
      responseConverter: JsonConverter.responseFactory,
    );
  }

  @override
  Future<Response<dynamic>> search({
    String? query,
    String? expression,
    required String type,
    int? offset,
    int? limit,
  }) {
    final Uri $url = Uri.parse('/api/search');
    final Map<String, dynamic> $params = <String, dynamic>{
      'query': query,
      'expression': expression,
      'type': type,
      'offset': offset,
      'limit': limit,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>(
      $request,
      requestConverter: JsonConverter.requestFactory,
      responseConverter: JsonConverter.responseFactory,
    );
  }

  @override
  Future<Response<dynamic>> updateTrack({
    required int id,
    int? rating,
    String? playCount,
    int? usermark,
  }) {
    final Uri $url = Uri.parse('/api/library/tracks/${id}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'rating': rating,
      'play_count': playCount,
      'usermark': usermark,
    };
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>(
      $request,
      requestConverter: JsonConverter.requestFactory,
    );
  }
}
