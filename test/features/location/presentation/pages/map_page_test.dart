import 'package:bloc_test/bloc_test.dart'; // Importando o bloc_test
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:latlong2/latlong.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_location/features/location/presentation/cubit/map_cubit.dart';
import 'package:my_location/features/location/presentation/cubit/map_state.dart';
import 'package:my_location/features/location/presentation/pages/map_page.dart';

import '../../../dummy.dart';

void main() {
  const latLng = LatLng(56.7378, 11.6644);

  late MockMapCubit mockCubit;

  setUp(() {
    mockCubit = MockMapCubit();

    when(() => mockCubit.getCurrentLocation()).thenAnswer((_) async {});
  });

  blocTest<MapCubit, MapState>(
    'should issue MapStateLoading and then MapStateSuccess',
    build: () {
      when(() => mockCubit.stream).thenAnswer(
        (_) => Stream.fromIterable(
          [
            MapStateLoading(),
            MapStateSuccess(latLng),
          ],
        ),
      );
      return mockCubit;
    },
    act: (cubit) => cubit.getCurrentLocation(),
    expect: () => [MapStateLoading(), MapStateSuccess(latLng)],
  );

  testWidgets('should show CircularProgressIndicator when in loading state',
      (tester) async {
    when(() => mockCubit.state).thenReturn(MapStateLoading());

    await tester.pumpWidget(
      MaterialApp(
        home: MapPage(cubit: mockCubit),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('should show error and "Try again" button when in error state',
      (tester) async {
    when(() => mockCubit.state).thenReturn(
      MapStateError('Error when fetching location data'),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: MapPage(cubit: mockCubit),
      ),
    );

    expect(find.text('Error when searching for your location'), findsOneWidget);
    expect(find.text('Try again'), findsOneWidget);
  });

  testWidgets('should display map with marker when in success state',
      (tester) async {
    when(() => mockCubit.state).thenReturn(MapStateSuccess(latLng));

    await tester.pumpWidget(
      MaterialApp(
        home: MapPage(cubit: mockCubit),
      ),
    );

    expect(find.byType(FlutterMap), findsOneWidget);
    expect(find.byIcon(Icons.location_pin), findsOneWidget);
  });

  testWidgets('should call getCurrentLocation in initState', (tester) async {
    when(() => mockCubit.state).thenReturn(MapStateLoading());

    await tester.pumpWidget(
      MaterialApp(
        home: MapPage(cubit: mockCubit),
      ),
    );

    verify(() => mockCubit.getCurrentLocation()).called(1);
  });
}
