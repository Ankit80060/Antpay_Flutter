// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetchplan_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

fetchplan_list_model _$fetchplan_list_modelFromJson(
        Map<String, dynamic> json) =>
    fetchplan_list_model(
      dataplan: json['data'] == null
          ? null
          : Dataplan.fromJson(json['data'] as Map<String, dynamic>),
      aParam: json['aParam'] as String?,
    );

Map<String, dynamic> _$fetchplan_list_modelToJson(
        fetchplan_list_model instance) =>
    <String, dynamic>{
      'aParam': instance.aParam,
      'data': instance.dataplan,
    };

Dataplan _$DataplanFromJson(Map<String, dynamic> json) => Dataplan(
      datalist: (json['TOPUP'] as List<dynamic>?)
          ?.map((e) => Datalist.fromJson(e as Map<String, dynamic>))
          .toList(),
      data3g4g: (json['3G/4G'] as List<dynamic>?)
          ?.map((e) => Datalist.fromJson(e as Map<String, dynamic>))
          .toList(),
      Romaing: (json['Romaing'] as List<dynamic>?)
          ?.map((e) => Datalist.fromJson(e as Map<String, dynamic>))
          .toList(),
      COMBO: (json['COMBO'] as List<dynamic>?)
          ?.map((e) => Datalist.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..fullTT = (json['FULLTT'] as List<dynamic>?)
        ?.map((e) => Datalist.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$DataplanToJson(Dataplan instance) => <String, dynamic>{
      'TOPUP': instance.datalist,
      '3G/4G': instance.data3g4g,
      'FULLTT': instance.fullTT,
      'Romaing': instance.Romaing,
      'COMBO': instance.COMBO,
    };

Datalist _$DatalistFromJson(Map<String, dynamic> json) => Datalist(
      rs: json['rs'] as String?,
      desc: json['desc'] as String?,
      status: json['status'],
      validity: json['validity'] as String?,
      last_update: json['last_update'] as String?,
    );

Map<String, dynamic> _$DatalistToJson(Datalist instance) => <String, dynamic>{
      'rs': instance.rs,
      'desc': instance.desc,
      'validity': instance.validity,
      'last_update': instance.last_update,
      'status': instance.status,
    };

fetchPlanRequestModel _$fetchPlanRequestModelFromJson(
        Map<String, dynamic> json) =>
    fetchPlanRequestModel(
      circle: json['circle'] as String?,
      operator: json['operator'] as String?,
      type: json['type'] as String?,
      aParam: json['aParam'] as String?,
    );

Map<String, dynamic> _$fetchPlanRequestModelToJson(
        fetchPlanRequestModel instance) =>
    <String, dynamic>{
      'aParam': instance.aParam,
      'circle': instance.circle,
      'operator': instance.operator,
      'type': instance.type,
    };
