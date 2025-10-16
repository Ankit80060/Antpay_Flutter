// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_zone_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameZoneModel _$GameZoneModelFromJson(Map<String, dynamic> json) =>
    GameZoneModel(
      status: json['status'] as String,
      msg: json['msg'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => GameZoneData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GameZoneModelToJson(GameZoneModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data,
    };

GameZoneData _$GameZoneDataFromJson(Map<String, dynamic> json) => GameZoneData(
      name: json['name'] as String,
      banner: json['banner'] as String,
    );

Map<String, dynamic> _$GameZoneDataToJson(GameZoneData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'banner': instance.banner,
    };
