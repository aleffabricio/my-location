import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_location/features/location/data/models/map_ip_model.dart';
import 'package:my_location/features/location/domain/repositories/fetch_location_repository.dart';
import 'package:my_location/features/location/domain/usecases/fetch_location_usecase.dart';

import '../../../dummy.dart';

main() {
  const error = 'Error when fetching location data';

  late IFetchLocationUseCase usecase;
  late IFetchLocationRepository repository;
  late LocationModel model;

  setUp(() async {
    repository = MockFetchLocationRepository();
    usecase = FetchLocationUseCaseImpl(repository);

    final Map<String, dynamic> jsonMap = jsonDecode(
      File('assets/mocks/location_mock.json').readAsStringSync(),
    );

    model = LocationModel.fromJson(jsonMap);
  });

  test("should return an LocationModel to get the location", () async {
    when(() => repository()).thenAnswer(
      (realInvocation) async => Right(model),
    );

    final result = await usecase();

    expect(result.fold(id, id), isA<LocationModel>());
    expect(result.isRight(), true);

    verify(() => repository()).called(1);
  });

  test("should return an exception to get the location", () async {
    when(() => repository()).thenAnswer(
      (realInvocation) async => Left(
        Exception(error),
      ),
    );

    final result = await usecase();

    expect(result.fold(id, id), isA<Exception>());
    expect(result.isLeft(), true);

    verify(() => repository()).called(1);
  });
}
