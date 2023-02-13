import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:praxis_data/mapper/jokes/jokes_mappers.dart';
import 'package:praxis_data/models/jokes/dt_joke_list.dart';
import 'package:praxis_data/sources/network/common/url.dart';
import 'package:praxis_flutter_domain/entities/api_response.dart';
import 'package:praxis_flutter_domain/entities/jokes/dm_joke_list.dart';
import 'package:logging/logging.dart';

import 'common/exceptions/api_exception.dart';

const String genericApiFailMsg = "Unexpected API response!";

@injectable
class JokesApi {
  // Todo Inject all this fields.
  final _logger = Logger('jokesApi');
  final dio = Dio();
  final JokesListMapper _mapper;

  JokesApi(this._mapper);

  Future<ApiResponse<JokesListWithType>> getFiveRandomJokes() async {
    try {
      final networkResponse = await dio.get(URL.fiveRandomJokesUrl);
      if (networkResponse.data != null) {
        final parsedDataResponse = DTJokeList.fromJson(networkResponse.data);
        // Todo : Returning DomainModel It should be DataModels?
        final parsedDomainResponse = _mapper.mapToDomain(parsedDataResponse);
        return Success(data: parsedDomainResponse);
      } else {
        return Failure(
            error: APIException(
                networkResponse.statusMessage ?? genericApiFailMsg,
                networkResponse.statusCode ?? 0,
                networkResponse.statusMessage ?? genericApiFailMsg));
      }
    } on Exception catch (e, _) {
      _logger.log(Level.WARNING, "API Error: ${e.toString()}");
      return Failure(error: e);
    }
  }
}
