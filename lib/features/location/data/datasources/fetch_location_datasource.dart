import 'package:dartz/dartz.dart';
import 'package:my_location/features/location/data/models/map_ip_model.dart';

abstract class IFetchLocationDataSource {
  Future<Either<Exception, LocationModel>> call();
}
