// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:geolocator/geolocator.dart' as _i699;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:my_location/app/app.ioc.dart' as _i747;
import 'package:my_location/features/location/data/datasources/fetch_location_datasource.dart'
    as _i1058;
import 'package:my_location/features/location/data/repositories/fetch_location_impl_repository.dart'
    as _i591;
import 'package:my_location/features/location/domain/repositories/fetch_location_repository.dart'
    as _i971;
import 'package:my_location/features/location/domain/usecases/fetch_location_usecase.dart'
    as _i198;
import 'package:my_location/features/location/external/datasources/fetch_location_impl_datasource.dart'
    as _i738;
import 'package:my_location/features/location/presentation/cubit/map_cubit.dart'
    as _i252;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i361.Dio>(() => registerModule.dio);
    gh.factory<_i699.GeolocatorPlatform>(() => registerModule.geolocator);
    gh.factory<_i1058.IFetchLocationDataSource>(
        () => _i738.FetchLocationDataSourceImpl(provider: gh<_i361.Dio>()));
    gh.factory<_i971.IFetchLocationRepository>(() =>
        _i591.FetchLocationRepositoryImpl(
            gh<_i1058.IFetchLocationDataSource>()));
    gh.factory<_i198.IFetchLocationUseCase>(() =>
        _i198.FetchLocationUseCaseImpl(gh<_i971.IFetchLocationRepository>()));
    gh.lazySingleton<_i252.MapCubit>(() => _i252.MapCubit(
          gh<_i198.IFetchLocationUseCase>(),
          gh<_i699.GeolocatorPlatform>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i747.RegisterModule {}
