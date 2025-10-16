// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operator_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OperatorList _$OperatorListFromJson(Map<String, dynamic> json) => OperatorList(
      result: (json['results'] as List<dynamic>?)
          ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OperatorListToJson(OperatorList instance) =>
    <String, dynamic>{
      'results': instance.result,
    };

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      id: json['id'] as String?,
      service: json['service'] as String?,
      operator: json['operator'] as String?,
      operator_code: json['operator_code'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'id': instance.id,
      'service': instance.service,
      'operator': instance.operator,
      'operator_code': instance.operator_code,
      'status': instance.status,
    };
