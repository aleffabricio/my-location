import 'package:bloc_test/bloc_test.dart';
import 'package:latlong2/latlong.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_location/features/location/domain/repositories/fetch_location_repository.dart';
import 'package:my_location/features/location/domain/usecases/fetch_location_usecase.dart';
import 'package:my_location/features/location/presentation/cubit/map_cubit.dart';
import 'package:my_location/features/location/presentation/cubit/map_state.dart';

class MockFetchLocationUseCase extends Mock implements IFetchLocationUseCase {}

class MockFetchLocationRepository extends Mock
    implements IFetchLocationRepository {}

class MockMapCubit extends MockCubit<MapState> implements MapCubit {}

class MockLatLng extends Mock implements LatLng {}
