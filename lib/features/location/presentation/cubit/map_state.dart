import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';

abstract class MapState extends Equatable {}

class MapStateInitial extends MapState {
  @override
  List<Object?> get props => [];
}

class MapStateLoading extends MapState {
  @override
  List<Object?> get props => [];
}

class MapStateSuccess extends MapState {
  final LatLng latLng;

  MapStateSuccess(
    this.latLng,
  );

  @override
  List<Object?> get props => [latLng];
}

class MapStateError extends MapState {
  final String message;

  MapStateError(
    this.message,
  );
  @override
  List<Object?> get props => [message];
}
