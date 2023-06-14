// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../infrastructure/notifications/firebase_messaging.dart' as _i6;
import '../mapper/AlbumUIMapper.dart' as _i8;
import '../mapper/ArtistUiMapper.dart' as _i3;
import '../mapper/CategoryUiMapper.dart' as _i4;
import '../mapper/ItemUiMapper.dart' as _i5;
import '../mapper/TracksUIMapper.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

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
    gh.factory<_i3.ArtistUiMapper>(() => _i3.ArtistUiMapper());
    gh.factory<_i4.CategoryUiMapper>(() => _i4.CategoryUiMapper());
    gh.factory<_i5.ItemUiMapper>(() => _i5.ItemUiMapper());
    gh.factory<_i6.PraxisFirebaseMessaging>(
        () => _i6.PraxisFirebaseMessaging());
    gh.factory<_i7.TracksUiMapper>(
        () => _i7.TracksUiMapper(get<_i5.ItemUiMapper>()));
    gh.factory<_i8.AlbumUiMapper>(() => _i8.AlbumUiMapper(
          get<_i3.ArtistUiMapper>(),
          get<_i7.TracksUiMapper>(),
        ));
    return this;
  }
}
