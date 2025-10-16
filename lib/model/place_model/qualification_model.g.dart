// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qualification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Qualification _$QualificationFromJson(Map<String, dynamic> json) =>
    Qualification(
      status: json['status'],
      list: (json['qualification_list'] as List<dynamic>?)
          ?.map((e) => QualificationList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QualificationToJson(Qualification instance) =>
    <String, dynamic>{
      'status': instance.status,
      'qualification_list': instance.list,
    };

QualificationList _$QualificationListFromJson(Map<String, dynamic> json) =>
    QualificationList(
      id: json['id'] as String?,
      qualification: json['qualification'] as String?,
    );

Map<String, dynamic> _$QualificationListToJson(QualificationList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'qualification': instance.qualification,
    };
