import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:praxis_flutter_domain/use_cases/GetNewRefreshTokenUseCase.dart';
import 'package:praxis_flutter_domain/use_cases/GetMultipleAlbumUseCase.dart';

@module
abstract class UseCaseModule {
  GetNewRefreshTokenUseCase get getNewRefreshTokenUseCase =>
      GetNewRefreshTokenUseCase(GetIt.I.get());

  GetMultipleAlbumUseCase get getMultipleAlbumUseCase =>
      GetMultipleAlbumUseCase(GetIt.I.get());
}
