import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_location/features/location/data/datasources/fetch_location_datasource.dart';
import 'package:my_location/features/location/data/models/map_ip_model.dart';

const _baseUrl = 'http://ip-api.com/json/?lang=pt-BR';

@Injectable(as: IFetchLocationDataSource)
class FetchLocationDataSourceImpl implements IFetchLocationDataSource {
  final Dio provider;

  FetchLocationDataSourceImpl({
    required this.provider,
  });

  @override
  Future<Either<Exception, LocationModel>> call() async {
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 80),
      receiveTimeout: const Duration(seconds: 50),
    );

    provider.options = options;

    try {
      final response = await provider.get(_baseUrl);

      if (response.data != null) {
        return Right(
          LocationModel.fromJson(response.data),
        );
      } else {
        return Left(Exception('Location is null'));
      }
    } catch (error) {
      return Left(
        Exception('Error when fetching location data \n $error'),
      );
    }
  }
}
