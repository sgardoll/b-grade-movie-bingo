import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start The Movie Database API Group Code

class TheMovieDatabaseAPIGroup {
  static String baseUrl = 'https://api.themoviedb.org';
  static Map<String, String> headers = {};
  static DiscoverMoviesCall discoverMoviesCall = DiscoverMoviesCall();
  static SearchMoviesCall searchMoviesCall = SearchMoviesCall();
}

class DiscoverMoviesCall {
  Future<ApiCallResponse> call({
    String? apiKey = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Discover Movies',
      apiUrl: '${TheMovieDatabaseAPIGroup.baseUrl}/3/discover/movie',
      callType: ApiCallType.GET,
      headers: {
        ...TheMovieDatabaseAPIGroup.headers,
      },
      params: {
        'api_key': apiKey,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SearchMoviesCall {
  Future<ApiCallResponse> call({
    String? apiKey = '',
    String? query = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Search Movies',
      apiUrl: '${TheMovieDatabaseAPIGroup.baseUrl}/3/search/movie',
      callType: ApiCallType.GET,
      headers: {
        ...TheMovieDatabaseAPIGroup.headers,
      },
      params: {
        'api_key': apiKey,
        'query': query,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic originalTitle(dynamic response) => getJsonField(
        response,
        r'''$.results[:].original_title''',
        true,
      );
  dynamic overview(dynamic response) => getJsonField(
        response,
        r'''$.results[:].overview''',
        true,
      );
  dynamic popularity(dynamic response) => getJsonField(
        response,
        r'''$.results[:].popularity''',
        true,
      );
  dynamic posterPath(dynamic response) => getJsonField(
        response,
        r'''$.results[:].poster_path''',
        true,
      );
  dynamic backdropPath(dynamic response) => getJsonField(
        response,
        r'''$.results[:].backdrop_path''',
        true,
      );
  dynamic title(dynamic response) => getJsonField(
        response,
        r'''$.results[:].title''',
        true,
      );
  dynamic releaseDate(dynamic response) => getJsonField(
        response,
        r'''$.results[:].release_date''',
        true,
      );
}

/// End The Movie Database API Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
