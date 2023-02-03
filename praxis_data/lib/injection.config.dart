// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:praxis_flutter_domain/repositories/jokes/jokes_repository.dart'
    as _i19;
import 'package:praxis_flutter_domain/repositories/login_repo.dart' as _i11;
import 'package:praxis_flutter_domain/repositories/song/SongsRepository.dart'
    as _i16;
import 'package:praxis_flutter_domain/use_cases/DummyGetCachedAlbumbsUseCase.dart'
    as _i5;
import 'package:praxis_flutter_domain/use_cases/get_cached_fav_albums_use_case.dart'
    as _i6;
import 'package:praxis_flutter_domain/use_cases/get_five_random_jokes_usecase.dart'
    as _i7;
import 'package:praxis_flutter_domain/use_cases/get_random_song_list_usecase.dart'
    as _i8;
import 'package:praxis_flutter_domain/use_cases/insert_remove_fav_album_from_db_usecase.dart'
    as _i9;
import 'package:praxis_flutter_domain/use_cases/login_use_case.dart' as _i13;

import 'mapper/jokes/jokes_mappers.dart' as _i10;
import 'mapper/song/SongsListMapper.dart' as _i4;
import 'repositories/jokes/data_jokes_repository.dart' as _i20;
import 'repositories/pr_login_repo.dart' as _i12;
import 'repositories/song/DataAlbumRepository.dart' as _i17;
import 'sources/local/album_db/album_database.dart' as _i3;
import 'sources/local/praxis_database.dart' as _i14;
import 'sources/network/jokes_api.dart' as _i18;
import 'sources/network/RandomTopAlbumDataSource.dart' as _i15;
import 'usecases/usecase_module.dart'
    as _i21; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// an extension to register the provided dependencies inside of [GetIt]
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of provided dependencies inside of [GetIt]
  _i1.GetIt $initGetIt({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final useCaseModule = _$UseCaseModule();
    gh.singleton<_i3.AlbumDatabase>(_i3.AlbumDatabase());
    gh.factory<_i4.DataSongModelMapper>(() => _i4.DataSongModelMapper());
    gh.factory<_i5.DummyGetCachedAlbumbsUseCase>(
        () => useCaseModule.getDummyGetCachedAlbumbsUseCae);
    gh.factory<_i6.GetCachedFavAlbumUseCase>(
        () => useCaseModule.getCachedFavAlbumUseCase);
    gh.factory<_i7.GetFiveRandomJokesUseCase>(
        () => useCaseModule.getJokesUseCase);
    gh.factory<_i8.GetRandomSongListUseCase>(
        () => useCaseModule.getRandomSongListUseCase);
    gh.factory<_i9.InsertRemoveFavAlbumFromDbUseCase>(
        () => useCaseModule.getInsertRemoveFavAlbumFromDbUseCase);
    gh.factory<_i10.JokeMapper>(() => _i10.JokeMapper());
    gh.factory<_i10.JokesListMapper>(
        () => _i10.JokesListMapper(get<_i10.JokeMapper>()));
    gh.factory<_i11.LoginRepo>(() => _i12.PraxisLoginRepo());
    gh.factory<_i13.LoginUseCase>(() => useCaseModule.loginUseCase);
    gh.singleton<_i14.PraxisDatabase>(_i14.PraxisDatabase());
    gh.factory<_i15.RandomTopAlbumDataSource>(
        () => _i15.RandomTopAlbumDataSource());
    gh.factory<_i4.SongsListMapper>(
        () => _i4.SongsListMapper(get<_i4.DataSongModelMapper>()));
    gh.factory<_i16.SongsRepository>(() => _i17.DataAlbumRepository(
          get<_i15.RandomTopAlbumDataSource>(),
          get<_i4.SongsListMapper>(),
          get<_i3.AlbumDatabase>(),
          get<_i4.DataSongModelMapper>(),
        ));
    gh.factory<_i18.JokesApi>(() => _i18.JokesApi(get<_i10.JokesListMapper>()));
    gh.factory<_i19.JokesRepository>(() => _i20.DataJokesRepository(
          get<_i10.JokesListMapper>(),
          get<_i18.JokesApi>(),
          get<_i14.PraxisDatabase>(),
          get<_i10.JokeMapper>(),
        ));
    return this;
  }
}

class _$UseCaseModule extends _i21.UseCaseModule {}
