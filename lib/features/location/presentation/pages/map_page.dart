import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:my_location/features/location/presentation/constants/map_page_constants.dart';
import 'package:my_location/features/location/presentation/cubit/map_cubit.dart';
import 'package:my_location/features/location/presentation/cubit/map_state.dart';

class MapPage extends StatefulWidget {
  final MapCubit cubit;

  const MapPage({
    super.key,
    required this.cubit,
  });

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with MapPageConstants {
  @override
  initState() {
    super.initState();
    widget.cubit.getCurrentLocation();
  }

  Marker buildPin(LatLng point) => Marker(
        point: point,
        width: 70,
        height: 70,
        child: const Icon(
          Icons.location_pin,
          size: 70,
          color: Colors.red,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MapCubit, MapState>(
        bloc: widget.cubit,
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          if (state is MapStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is MapStateError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(mapError),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: widget.cubit.getCurrentLocation,
                  child: Text(tryAgain),
                )
              ],
            );
          }

          if (state is MapStateSuccess) {
            return FlutterMap(
              options: MapOptions(
                initialCenter: state.latLng,
                initialZoom: 17,
              ),
              children: [
                TileLayer(
                  urlTemplate: urlTemplate,
                ),
                MarkerLayer(
                  markers: [
                    buildPin(state.latLng),
                  ],
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
