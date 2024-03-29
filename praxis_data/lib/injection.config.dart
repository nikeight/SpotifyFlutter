// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:praxis_flutter_domain/repositories/LibraryRepository.dart'
    as _i26;
import 'package:praxis_flutter_domain/repositories/SpotifyRepository.dart'
    as _i22;
import 'package:praxis_flutter_domain/repositories/SpotifySearchRepository.dart'
    as _i24;
import 'package:praxis_flutter_domain/use_cases/GetLibraryFetchedAlbumUseCase.dart'
    as _i8;
import 'package:praxis_flutter_domain/use_cases/GetMultipleAlbumUseCase.dart'
    as _i9;
import 'package:praxis_flutter_domain/use_cases/GetNewRefreshTokenUseCase.dart'
    as _i10;
import 'package:praxis_flutter_domain/use_cases/GetTrackListUseCase.dart'
    as _i13;
import 'package:praxis_flutter_domain/use_cases/search/GetSearchQueryItemUseCase.dart'
    as _i11;
import 'package:praxis_flutter_domain/use_cases/search/GetSpotifyCategoriesUseCase.dart'
    as _i12;
import 'package:shared_preferences/shared_preferences.dart' as _i16;

import 'di/injection_dart.dart' as _i28;
import 'mapper/AlbumModellMapper.dart' as _i4;
import 'mapper/ArtistDataDomainMapper.dart' as _i5;
import 'mapper/CategoryDataDomainMapper.dart' as _i6;
import 'mapper/ItemDataDomainMapper.dart' as _i14;
import 'mapper/SearchQueryDataDomainMapper.dart' as _i15;
import 'mapper/TrackDataDomainMapper.dart' as _i17;
import 'repositories/LibraryRepositoryImpl.dart' as _i27;
import 'repositories/SpotifyHomeRepositoryImpl.dart' as _i23;
import 'repositories/SpotifySearchRepositoryImpl.dart' as _i25;
import 'sources/local/album_db/album_database.dart' as _i3;
import 'sources/network/common/custom_api_client.dart' as _i18;
import 'sources/network/source/RandomTopAlbumDataSource.dart' as _i19;
import 'sources/network/source/spotify_data_source.dart' as _i20;
import 'sources/network/source/SpotifyDataSourceImpl.dart' as _i21;
import 'usecases/usecase_module.dart'
    as _i29; // ignore_for_file: unnecessary_lambdas

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
    gh.factory<_i6.CategoryDataDomainMapper>(
        () => _i6.CategoryDataDomainMapper());
    gh.factory<_i7.Dio>(() => networkModule.dioHttpInstance());
    gh.factory<_i8.GetLibraryFetchedAlbumUseCase>(
        () => useCaseModule.getLibraryFetchedAlbumUseCase);
    gh.factory<_i9.GetMultipleAlbumUseCase>(
        () => useCaseModule.getMultipleAlbumUseCase);
    gh.factory<_i10.GetNewRefreshTokenUseCase>(
        () => useCaseModule.getNewRefreshTokenUseCase);
    gh.factory<_i11.GetSearchQueryItemUseCase>(
        () => useCaseModule.getSearchQueryItemUseCase);
    gh.factory<_i12.GetSpotifyCategoriesUseCase>(
        () => useCaseModule.getSpotifyCategoriesUseCase);
    gh.factory<_i13.GetTrackListUseCase>(
        () => useCaseModule.getTrackListUseCase);
    gh.factory<_i14.ItemDataDomainMapper>(
        () => _i14.ItemDataDomainMapper(get<_i5.ArtistDataDomainMapper>()));
    gh.factory<_i15.SearchQueryDataDomainMapper>(
        () => _i15.SearchQueryDataDomainMapper());
    await gh.factoryAsync<_i16.SharedPreferences>(
      () => storageModule.sharedPrefs,
      preResolve: true,
    );
    gh.factory<_i17.TrackDataDomainMapper>(
        () => _i17.TrackDataDomainMapper(get<_i14.ItemDataDomainMapper>()));
    gh.factory<_i18.CustomApiClient>(
        () => _i18.CustomApiClient(get<_i7.Dio>()));
    gh.factory<_i19.RandomTopAlbumDataSource>(
        () => _i19.RandomTopAlbumDataSource(get<_i18.CustomApiClient>()));
    gh.factory<_i20.SpotifyDatasource>(() => _i21.SpotifyDataSourceImpl(
          get<_i18.CustomApiClient>(),
          get<_i16.SharedPreferences>(),
        ));
    gh.factory<_i22.SpotifyRepository>(() => _i23.SpotifyHomeRepositoryImpl(
          get<_i20.SpotifyDatasource>(),
          get<_i4.AlbumModelMapper>(),
          get<_i17.TrackDataDomainMapper>(),
        ));
    gh.factory<_i24.SpotifySearchRepository>(
        () => _i25.SpotifySearchRepositoryImpl(
              get<_i18.CustomApiClient>(),
              get<_i20.SpotifyDatasource>(),
              get<_i6.CategoryDataDomainMapper>(),
              get<_i15.SearchQueryDataDomainMapper>(),
            ));
    gh.factory<_i26.LibraryRepository>(() => _i27.LibraryRepositoryImpl(
          get<_i20.SpotifyDatasource>(),
          get<_i4.AlbumModelMapper>(),
          get<_i17.TrackDataDomainMapper>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i28.NetworkModule {}

class _$UseCaseModule extends _i29.UseCaseModule {}

class _$StorageModule extends _i28.StorageModule {}
