import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_location/features/location/domain/entities/map_ip_entity.dart';
import 'package:my_location/features/location/domain/repositories/fetch_location_repository.dart';

abstract class IFetchLocationUseCase {
  Future<Either<Exception, LocationEntity>> call();
}

@Injectable(as: IFetchLocationUseCase)
class FetchLocationUseCaseImpl implements IFetchLocationUseCase {
  final IFetchLocationRepository _fetchLocationRepository;

  FetchLocationUseCaseImpl(
    this._fetchLocationRepository,
  );

  @override
  Future<Either<Exception, LocationEntity>> call() async =>
      _fetchLocationRepository();
}
