import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:fownamp/services/chopper_aggregate_logger.dart';

final aggregateLogger = ChopperAggregateLogger();

/// A HttpLoggingInterceptor that aggregates the request and
/// response logs from Chopper, using the [ChopperAggregateLogger].
class HttpAggregateLoggingInterceptor implements Interceptor {
  final Level level;

  HttpAggregateLoggingInterceptor({this.level = Level.body});

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
    Chain<BodyType> chain,
  ) async {
    final request = chain.request;

    aggregateLogger.onStartRequest(request);

    final response = await chain.proceed(request);

    aggregateLogger.onEndRequest(request);
    aggregateLogger.onStartResponse(response);
    aggregateLogger.onEndResponse(response);

    return response;
  }
}
