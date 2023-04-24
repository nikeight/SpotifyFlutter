// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'di/injection_dart.dart' as _i7;
import 'sources/local/album_db/album_database.dart' as _i3;
import 'sources/network/common/custom_api_client.dart' as _i5;
import 'sources/network/source/RandomTopAlbumDataSource.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

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
    gh.singleton<_i3.AlbumDatabase>(_i3.AlbumDatabase());
    gh.factory<_i4.Dio>(() => networkModule.dioHttpInstance());
    gh.factory<_i5.CustomApiClient>(() => _i5.CustomApiClient(get<_i4.Dio>()));
    gh.factory<_i6.RandomTopAlbumDataSource>(
        () => _i6.RandomTopAlbumDataSource(get<_i5.CustomApiClient>()));
    return this;
  }
}

class _$NetworkModule extends _i7.NetworkModule {}
