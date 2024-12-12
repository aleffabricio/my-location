import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:my_location/app/app.ioc.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();

@module
abstract class RegisterModule {
  @injectable
  Dio get dio => Dio();

  @injectable
  GeolocatorPlatform get geolocator => GeolocatorPlatform.instance;
}
