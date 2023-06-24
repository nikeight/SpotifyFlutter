import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:praxis_flutter_domain/use_cases/GetNewRefreshTokenUseCase.dart';
import 'package:praxis_flutter_domain/use_cases/GetMultipleAlbumUseCase.dart';
import 'package:praxis_flutter_domain/use_cases/GetTrackListUseCase.dart';
import 'package:praxis_flutter_domain/use_cases/search/GetSpotifyCategoriesUseCase.dart';
import 'package:praxis_flutter_domain/use_cases/search/GetSearchQueryItemUseCase.dart';
import 'package:praxis_flutter_domain/use_cases/GetLibraryFetchedAlbumUseCase.dart';

@module
abstract class UseCaseModule {
  GetNewRefreshTokenUseCase get getNewRefreshTokenUseCase =>
      GetNewRefreshTokenUseCase(GetIt.I.get());

  GetMultipleAlbumUseCase get getMultipleAlbumUseCase =>
      GetMultipleAlbumUseCase(GetIt.I.get());

  GetTrackListUseCase get getTrackListUseCase =>
      GetTrackListUseCase(GetIt.I.get());

  GetSpotifyCategoriesUseCase get getSpotifyCategoriesUseCase =>
      GetSpotifyCategoriesUseCase(GetIt.I.get());

  GetSearchQueryItemUseCase get getSearchQueryItemUseCase =>
      GetSearchQueryItemUseCase(GetIt.I.get());

  GetLibraryFetchedAlbumUseCase get getLibraryFetchedAlbumUseCase =>
      GetLibraryFetchedAlbumUseCase(GetIt.I.get());
}
