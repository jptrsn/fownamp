import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:get_it/get_it.dart';

import '../models/owntone_models.dart';
import 'finamp_user_helper.dart';
import 'http_aggregate_logging_interceptor.dart';
import 'owntone_api_helper.dart';

part 'owntone_api.chopper.dart';

@ChopperApi()
abstract class OwnToneApi extends ChopperService {
  /// Get library information
  @FactoryConverter(
    request: JsonConverter.requestFactory,
    response: JsonConverter.responseFactory,
  )
  @Get(path: "/api/library")
  Future<Response> getLibrary();

  /// List artists
  @FactoryConverter(
    request: JsonConverter.requestFactory,
    response: JsonConverter.responseFactory,
  )
  @Get(path: "/api/library/artists")
  Future<Response> getArtists({
    @Query("offset") int? offset,
    @Query("limit") int? limit,
  });

  /// Get a specific artist
  @FactoryConverter(
    request: JsonConverter.requestFactory,
    response: JsonConverter.responseFactory,
  )
  @Get(path: "/api/library/artists/{id}")
  Future<Response> getArtist({
    @Path() required String id,
  });

  /// List artist's albums
  @FactoryConverter(
    request: JsonConverter.requestFactory,
    response: JsonConverter.responseFactory,
  )
  @Get(path: "/api/library/artists/{id}/albums")
  Future<Response<OwnToneAlbumList>> getArtistAlbums({
    @Path() required String id,
    @Query("offset") int? offset,
    @Query("limit") int? limit,
  });

  /// List albums
  @FactoryConverter(
    request: JsonConverter.requestFactory,
    response: JsonConverter.responseFactory,
  )
  @Get(path: "/api/library/albums")
  Future<Response> getAlbums({
    @Query("offset") int? offset,
    @Query("limit") int? limit,
  });

  /// Get a specific album
  @FactoryConverter(
    request: JsonConverter.requestFactory,
    response: JsonConverter.responseFactory,
  )
  @Get(path: "/api/library/albums/{id}")
  Future<Response<OwnToneAlbum>> getAlbum({
    @Path() required String id,
  });

  /// List album's tracks
  @FactoryConverter(
    request: JsonConverter.requestFactory,
    response: JsonConverter.responseFactory,
  )
  @Get(path: "/api/library/albums/{id}/tracks")
  Future<Response> getAlbumTracks({
    @Path() required String id,
    @Query("offset") int? offset,
    @Query("limit") int? limit,
  });

  /// Get a specific track
  @FactoryConverter(
    request: JsonConverter.requestFactory,
    response: JsonConverter.responseFactory,
  )
  @Get(path: "/api/library/tracks/{id}")
  Future<Response> getTrack({
    @Path() required int id,
  });

  /// List playlists
  @FactoryConverter(
    request: JsonConverter.requestFactory,
    response: JsonConverter.responseFactory,
  )
  @Get(path: "/api/library/playlists")
  Future<Response> getPlaylists({
    @Query("offset") int? offset,
    @Query("limit") int? limit,
  });

  /// Get a specific playlist
  @FactoryConverter(
    request: JsonConverter.requestFactory,
    response: JsonConverter.responseFactory,
  )
  @Get(path: "/api/library/playlists/{id}")
  Future<Response> getPlaylist({
    @Path() required int id,
  });

  /// List playlist tracks
  @FactoryConverter(
    request: JsonConverter.requestFactory,
    response: JsonConverter.responseFactory,
  )
  @Get(path: "/api/library/playlists/{id}/tracks")
  Future<Response> getPlaylistTracks({
    @Path() required int id,
    @Query("offset") int? offset,
    @Query("limit") int? limit,
  });

  /// Search library
  @FactoryConverter(
    request: JsonConverter.requestFactory,
    response: JsonConverter.responseFactory,
  )
  @Get(path: "/api/search")
  Future<Response> search({
    @Query("query") String? query,
    @Query("expression") String? expression,
    @Query("type") required String type,
    @Query("offset") int? offset,
    @Query("limit") int? limit,
  });

  /// List genres
  @FactoryConverter(
    request: JsonConverter.requestFactory,
    response: JsonConverter.responseFactory,
  )
  @Get(path: "/api/library/genres")
  Future<Response> getGenres({
    @Query("offset") int? offset,
    @Query("limit") int? limit,
  });

  /// Update track properties (rating, play count, etc)
  @FactoryConverter(
    request: JsonConverter.requestFactory,
  )
  @Put(path: "/api/library/tracks/{id}", optionalBody: true)
  Future<Response> updateTrack({
    @Path() required int id,
    @Query("rating") int? rating,
    @Query("play_count") String? playCount, // "increment", "reset", or number
    @Query("usermark") int? usermark,
  });

  static OwnToneApi create() {
    final client = ChopperClient(
      services: [
        _$OwnToneApi(),
      ],
      interceptors: [
        _BaseUrlInterceptor(),
        HttpAggregateLoggingInterceptor(),
      ],
    );

    return _$OwnToneApi(client);
  }
}

/// Interceptor to add the base URL from settings
class _BaseUrlInterceptor implements Interceptor {
  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
    Chain<BodyType> chain,
  ) async {
    final ownToneApiHelper = GetIt.instance<OwnToneApiHelper>();
    final finampUserHelper = GetIt.instance<FinampUserHelper>();

    // Use baseUrlTemp if set (during setup), otherwise use current user's baseUrl
    Uri baseUri = ownToneApiHelper.baseUrlTemp ??
        Uri.parse(finampUserHelper.currentUser!.baseUrl);

    // Add the request path to the base URL
    baseUri = baseUri.replace(
      pathSegments:
          baseUri.pathSegments.followedBy(chain.request.uri.pathSegments),
    );

    final request = chain.request.copyWith(
      uri: baseUri,
      headers: {
        "Content-Type": "application/json",
      },
    );

    return chain.proceed(request);
  }
}
