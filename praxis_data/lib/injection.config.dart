// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:praxis_flutter_domain/repositories/LibraryRepository.dart'
    as _i20;
import 'package:praxis_flutter_domain/repositories/SpotifyRepository.dart'
    as _i18;
import 'package:praxis_flutter_domain/use_cases/GetLibraryFetchedAlbumUseCase.dart'
    as _i7;
import 'package:praxis_flutter_domain/use_cases/GetMultipleAlbumUseCase.dart'
    as _i8;
import 'package:praxis_flutter_domain/use_cases/GetNewRefreshTokenUseCase.dart'
    as _i9;
import 'package:praxis_flutter_domain/use_cases/GetTrackListUseCase.dart'
    as _i10;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

import 'di/injection_dart.dart' as _i22;
import 'mapper/AlbumModellMapper.dart' as _i4;
import 'mapper/ArtistDataDomainMapper.dart' as _i5;
import 'mapper/ItemDataDomainMapper.dart' as _i11;
import 'mapper/TrackDataDomainMapper.dart' as _i13;
import 'repositories/LibraryRepositoryImpl.dart' as _i21;
import 'repositories/SpotifyHomeRepositoryImpl.dart' as _i19;
import 'sources/local/album_db/album_database.dart' as _i3;
import 'sources/network/common/custom_api_client.dart' as _i14;
import 'sources/network/source/RandomTopAlbumDataSource.dart' as _i15;
import 'sources/network/source/spotify_data_source.dart' as _i16;
import 'sources/network/source/SpotifyDataSourceImpl.dart' as _i17;
import 'usecases/usecase_module.dart'
    as _i23; // ignore_for_file: unnecessary_lambdas

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
    gh.factory<_i5.ArtistDataDomainMapper>(() => _i5.ArtistDataDomainMapper());
    gh.factory<_i6.Dio>(() => networkModule.dioHttpInstance());
    gh.factory<_i7.GetLibraryFetchedAlbumUseCase>(
        () => useCaseModule.getLibraryFetchedAlbumUseCase);
    gh.factory<_i8.GetMultipleAlbumUseCase>(
        () => useCaseModule.getMultipleAlbumUseCase);
    gh.factory<_i9.GetNewRefreshTokenUseCase>(
        () => useCaseModule.getNewRefreshTokenUseCase);
    gh.factory<_i10.GetTrackListUseCase>(
        () => useCaseModule.getTrackListUseCase);
    gh.factory<_i11.ItemDataDomainMapper>(
        () => _i11.ItemDataDomainMapper(get<_i5.ArtistDataDomainMapper>()));
    await gh.factoryAsync<_i12.SharedPreferences>(
      () => storageModule.sharedPrefs,
      preResolve: true,
    );
    gh.factory<_i13.TrackDataDomainMapper>(
        () => _i13.TrackDataDomainMapper(get<_i11.ItemDataDomainMapper>()));
    gh.factory<_i14.CustomApiClient>(
        () => _i14.CustomApiClient(get<_i6.Dio>()));
    gh.factory<_i15.RandomTopAlbumDataSource>(
        () => _i15.RandomTopAlbumDataSource(get<_i14.CustomApiClient>()));
    gh.factory<_i16.SpotifyDatasource>(() => _i17.SpotifyDataSourceImpl(
          get<_i14.CustomApiClient>(),
          get<_i12.SharedPreferences>(),
        ));
    gh.factory<_i18.SpotifyRepository>(() => _i19.SpotifyHomeRepositoryImpl(
          get<_i16.SpotifyDatasource>(),
          get<_i4.AlbumModelMapper>(),
          get<_i13.TrackDataDomainMapper>(),
        ));
    gh.factory<_i20.LibraryRepository>(() => _i21.LibraryRepositoryImpl(
          get<_i16.SpotifyDatasource>(),
          get<_i4.AlbumModelMapper>(),
          get<_i13.TrackDataDomainMapper>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i22.NetworkModule {}

class _$UseCaseModule extends _i23.UseCaseModule {}

class _$StorageModule extends _i22.StorageModule {}
