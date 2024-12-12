import 'package:dartz/dartz.dart';
import 'package:my_location/features/location/domain/entities/map_ip_entity.dart';

abstract class IFetchLocationRepository {
  Future<Either<Exception, LocationEntity>> call();
}
