// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:praxis_flutter_domain/repositories/song/SongsRepository.dart'
    as _i11;
import 'package:praxis_flutter_domain/use_cases/get_cached_fav_albums_use_case.dart'
    as _i6;
import 'package:praxis_flutter_domain/use_cases/get_random_song_list_usecase.dart'
    as _i7;
import 'package:praxis_flutter_domain/use_cases/insert_remove_fav_album_from_db_usecase.dart'
    as _i8;

import 'di/injection_dart.dart' as _i13;
import 'mapper/song/SongsListMapper.dart' as _i4;
import 'repositories/song/DataAlbumRepository.dart' as _i12;
import 'sources/local/album_db/album_database.dart' as _i3;
import 'sources/network/common/custom_api_client.dart' as _i9;
import 'sources/network/source/RandomTopAlbumDataSource.dart' as _i10;
import 'usecases/usecase_module.dart'
    as _i14; // ignore_for_file: unnecessary_lambdas

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
    final networkModule = _$NetworkModule();
    final useCaseModule = _$UseCaseModule();
    gh.singleton<_i3.AlbumDatabase>(_i3.AlbumDatabase());
    gh.factory<_i4.DataSongModelMapper>(() => _i4.DataSongModelMapper());
    gh.factory<_i5.Dio>(() => networkModule.dioHttpInstance());
    gh.factory<_i6.GetCachedFavAlbumUseCase>(
        () => useCaseModule.getCachedFavAlbumUseCase);
    gh.factory<_i7.GetRandomSongListUseCase>(
        () => useCaseModule.getRandomSongListUseCase);
    gh.factory<_i8.InsertRemoveFavAlbumFromDbUseCase>(
        () => useCaseModule.getInsertRemoveFavAlbumFromDbUseCase);
    gh.factory<_i4.SongsListMapper>(
        () => _i4.SongsListMapper(get<_i4.DataSongModelMapper>()));
    gh.factory<_i9.CustomApiClient>(() => _i9.CustomApiClient(get<_i5.Dio>()));
    gh.factory<_i10.RandomTopAlbumDataSource>(
        () => _i10.RandomTopAlbumDataSource(get<_i9.CustomApiClient>()));
    gh.factory<_i11.SongsRepository>(() => _i12.DataAlbumRepository(
          get<_i10.RandomTopAlbumDataSource>(),
          get<_i4.SongsListMapper>(),
          get<_i3.AlbumDatabase>(),
          get<_i4.DataSongModelMapper>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i13.NetworkModule {}

class _$UseCaseModule extends _i14.UseCaseModule {}
