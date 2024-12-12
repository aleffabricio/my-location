import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_location/features/location/data/datasources/fetch_location_datasource.dart';
import 'package:my_location/features/location/domain/entities/map_ip_entity.dart';
import 'package:my_location/features/location/domain/repositories/fetch_location_repository.dart';

@Injectable(as: IFetchLocationRepository)
class FetchLocationRepositoryImpl implements IFetchLocationRepository {
  final IFetchLocationDataSource iFetchLocationDataSource;

  FetchLocationRepositoryImpl(
    this.iFetchLocationDataSource,
  );

  @override
  Future<Either<Exception, LocationEntity>> call() async {
    return await iFetchLocationDataSource();
  }
}
