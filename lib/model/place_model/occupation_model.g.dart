// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'occupation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Occupation _$OccupationFromJson(Map<String, dynamic> json) => Occupation(
      status: json['status'],
      list: (json['occupation_list'] as List<dynamic>?)
          ?.map((e) => OccupationList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OccupationToJson(Occupation instance) =>
    <String, dynamic>{
      'status': instance.status,
      'occupation_list': instance.list,
    };

OccupationList _$OccupationListFromJson(Map<String, dynamic> json) =>
    OccupationList(
      id: json['id'] as String?,
      occupation: json['name'] as String?,
    );

Map<String, dynamic> _$OccupationListToJson(OccupationList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.occupation,
    };
