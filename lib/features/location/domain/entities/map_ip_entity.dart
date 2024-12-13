import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  final String query;
  final String status;
  final String country;
  final String countryCode;
  final String region;
  final String regionName;
  final String city;
  final String zip;
  final double lat;
  final double lon;
  final String timezone;
  final String isp;
  final String org;
  final String locationEntityAs;

  const LocationEntity({
    required this.query,
    required this.status,
    required this.country,
    required this.countryCode,
    required this.region,
    required this.regionName,
    required this.city,
    required this.zip,
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.isp,
    required this.org,
    required this.locationEntityAs,
  });

  @override
  List<Object?> get props => [
        query,
        status,
        country,
        countryCode,
        region,
        regionName,
        city,
        zip,
        lat,
        lon,
        timezone,
        isp,
        org,
        locationEntityAs,
      ];
}
