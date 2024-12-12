import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';
import 'package:my_location/features/location/domain/usecases/fetch_location_usecase.dart';
import 'package:my_location/features/location/presentation/cubit/map_state.dart';

@lazySingleton
class MapCubit extends Cubit<MapState> {
  final IFetchLocationUseCase _iFetchLocationUseCase;
  final GeolocatorPlatform _geolocator;

  MapCubit(
    this._iFetchLocationUseCase,
    this._geolocator,
  ) : super(MapStateInitial());

  Future<void> _fetchLocation() async {
    emit(MapStateLoading());

    final result = await _iFetchLocationUseCase();

    result.fold(
      (error) => emit(
        MapStateError(error.toString()),
      ),
      (location) => emit(MapStateSuccess(
        LatLng(
          location.lat,
          location.lon,
        ),
      )),
    );
  }

  Future<void> getCurrentLocation() async {
    final bool serviceEnabled;
    LocationPermission permission;

    emit(MapStateLoading());

    serviceEnabled = await _geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      _fetchLocation();
      return;
    }

    permission = await _geolocator.checkPermission();

    switch (permission) {
      case LocationPermission.denied:
        permission = await _geolocator.requestPermission();

        if (permission == LocationPermission.denied) return _fetchLocation();

        _getCurrent();
      case LocationPermission.deniedForever:
        _fetchLocation();
      default:
        return _getCurrent();
    }
  }

  Future<void> _getCurrent() async {
    try {
      final position = await _geolocator.getCurrentPosition(
        locationSettings: Platform.isAndroid
            ? AndroidSettings(accuracy: LocationAccuracy.high)
            : AppleSettings(accuracy: LocationAccuracy.high),
      );

      emit(
        MapStateSuccess(
          LatLng(position.latitude, position.longitude),
        ),
      );
    } on Exception catch (error) {
      emit(
        MapStateError(error.toString()),
      );
    }
  }
}
