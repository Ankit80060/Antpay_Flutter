// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

City _$CityFromJson(Map<String, dynamic> json) => City(
      id: json['id'] as String,
      cityName: json['city_name'] as String,
      stateCode: json['state_code'] as String,
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'city_name': instance.cityName,
      'state_code': instance.stateCode,
    };

CityListResponse _$CityListResponseFromJson(Map<String, dynamic> json) =>
    CityListResponse(
      status: (json['status'] as num).toInt(),
      cityList: (json['city_list'] as List<dynamic>)
          .map((e) => City.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CityListResponseToJson(CityListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'city_list': instance.cityList,
    };
