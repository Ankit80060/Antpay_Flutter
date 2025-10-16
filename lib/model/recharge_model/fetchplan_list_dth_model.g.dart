// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetchplan_list_dth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

fetchplan_list_dth_model _$fetchplan_list_dth_modelFromJson(
        Map<String, dynamic> json) =>
    fetchplan_list_dth_model(
      dataplan: json['data'] == null
          ? null
          : datalistdth.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$fetchplan_list_dth_modelToJson(
        fetchplan_list_dth_model instance) =>
    <String, dynamic>{
      'data': instance.dataplan,
    };

datalistdth _$datalistdthFromJson(Map<String, dynamic> json) => datalistdth(
      datalistdthaplan: (json['Plan'] as List<dynamic>?)
          ?.map((e) => Datalist.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$datalistdthToJson(datalistdth instance) =>
    <String, dynamic>{
      'Plan': instance.datalistdthaplan,
    };

Datalist _$DatalistFromJson(Map<String, dynamic> json) => Datalist(
      rs: json['rs'] == null
          ? null
          : Rs.fromJson(json['rs'] as Map<String, dynamic>),
      desc: json['desc'] as String?,
      status: json['status'],
      plan_name: json['plan_name'] as String?,
      last_update: json['last_update'] as String?,
    );

Map<String, dynamic> _$DatalistToJson(Datalist instance) => <String, dynamic>{
      'rs': instance.rs,
      'desc': instance.desc,
      'plan_name': instance.plan_name,
      'last_update': instance.last_update,
      'status': instance.status,
    };

Rs _$RsFromJson(Map<String, dynamic> json) => Rs(
      year1: json['1 YEAR'] as String?,
      months1: json['1 MONTHS'] as String?,
      months6: json['6 MONTHS'] as String?,
    );

Map<String, dynamic> _$RsToJson(Rs instance) => <String, dynamic>{
      '1 YEAR': instance.year1,
      '6 MONTHS': instance.months6,
      '1 MONTHS': instance.months1,
    };

fetchPlanRequestModeldth _$fetchPlanRequestModeldthFromJson(
        Map<String, dynamic> json) =>
    fetchPlanRequestModeldth(
      circle: json['circle'] as String?,
      operator: json['operator'] as String?,
      type: json['type'] as String?,
      aParam: json['aParam'] as String?,
    );

Map<String, dynamic> _$fetchPlanRequestModeldthToJson(
        fetchPlanRequestModeldth instance) =>
    <String, dynamic>{
      'circle': instance.circle,
      'operator': instance.operator,
      'type': instance.type,
      'aParam': instance.aParam,
    };
