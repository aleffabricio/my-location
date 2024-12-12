import 'package:my_location/features/location/domain/entities/map_ip_entity.dart';

class LocationModel extends LocationEntity {
  const LocationModel({
    required super.query,
    required super.status,
    required super.country,
    required super.countryCode,
    required super.region,
    required super.regionName,
    required super.city,
    required super.zip,
    required super.lat,
    required super.lon,
    required super.timezone,
    required super.isp,
    required super.org,
    required super.locationEntityAs,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        query: json['query'] ?? '',
        status: json['status'] ?? '',
        country: json['country'] ?? '',
        countryCode: json['countryCode'] ?? '',
        region: json['region'] ?? '',
        regionName: json['regionName'] ?? '',
        city: json['city'] ?? '',
        zip: json['zip'] ?? '',
        lat: json['lat']?.toDouble() ?? .0,
        lon: json['lon']?.toDouble() ?? .0,
        timezone: json['timezone'] ?? '',
        isp: json['isp'] ?? '',
        org: json['org'] ?? '',
        locationEntityAs: json['as'] ?? '',
      );
}
