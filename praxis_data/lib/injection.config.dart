// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:praxis_flutter_domain/repositories/SpotifyRepository.dart'
    as _i13;
import 'package:praxis_flutter_domain/use_cases/GetMultipleAlbumUseCase.dart'
    as _i6;
import 'package:praxis_flutter_domain/use_cases/GetNewRefreshTokenUseCase.dart'
    as _i7;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import 'di/injection_dart.dart' as _i15;
import 'mapper/AlbumModellMapper.dart' as _i4;
import 'repositories/SpotifyHomeRepositoryImpl.dart' as _i14;
import 'sources/local/album_db/album_database.dart' as _i3;
import 'sources/network/common/custom_api_client.dart' as _i9;
import 'sources/network/source/RandomTopAlbumDataSource.dart' as _i10;
import 'sources/network/source/spotify_data_source.dart' as _i11;
import 'sources/network/source/SpotifyDataSourceImpl.dart' as _i12;
import 'usecases/usecase_module.dart'
    as _i16; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// an extension to register the provided dependencies inside of [GetIt]
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of provided dependencies inside of [GetIt]
  Future<_i1.GetIt> $initGetIt({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    final useCaseModule = _$UseCaseModule();
    final storageModule = _$StorageModule();
    gh.singleton<_i3.AlbumDatabase>(_i3.AlbumDatabase());
    gh.factory<_i4.AlbumModelMapper>(() => _i4.AlbumModelMapper());
    gh.factory<_i5.Dio>(() => networkModule.dioHttpInstance());
    gh.factory<_i6.GetMultipleAlbumUseCase>(
        () => useCaseModule.getMultipleAlbumUseCase);
    gh.factory<_i7.GetNewRefreshTokenUseCase>(
        () => useCaseModule.getNewRefreshTokenUseCase);
    await gh.factoryAsync<_i8.SharedPreferences>(
      () => storageModule.sharedPrefs,
      preResolve: true,
    );
    gh.factory<_i9.CustomApiClient>(() => _i9.CustomApiClient(get<_i5.Dio>()));
    gh.factory<_i10.RandomTopAlbumDataSource>(
        () => _i10.RandomTopAlbumDataSource(get<_i9.CustomApiClient>()));
    gh.factory<_i11.SpotifyDatasource>(() => _i12.SpotifyDataSourceImpl(
          get<_i9.CustomApiClient>(),
          get<_i8.SharedPreferences>(),
        ));
    gh.factory<_i13.SpotifyRepository>(() => _i14.SpotifyHomeRepositoryImpl(
          get<_i11.SpotifyDatasource>(),
          get<_i4.AlbumModelMapper>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i15.NetworkModule {}

class _$UseCaseModule extends _i16.UseCaseModule {}

class _$StorageModule extends _i15.StorageModule {}
