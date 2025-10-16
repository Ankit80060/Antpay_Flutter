// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getBiller_inputfields_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

getBiller_inputfields_model _$getBiller_inputfields_modelFromJson(
        Map<String, dynamic> json) =>
    getBiller_inputfields_model(
      billerId: json['billerId'] as String?,
    );

Map<String, dynamic> _$getBiller_inputfields_modelToJson(
        getBiller_inputfields_model instance) =>
    <String, dynamic>{
      'billerId': instance.billerId,
    };

HealthinputfieldsResponseModel _$HealthinputfieldsResponseModelFromJson(
        Map<String, dynamic> json) =>
    HealthinputfieldsResponseModel(
      status: json['status'],
      msg: json['msg'] as String?,
      billers: (json['billers'] as List<dynamic>?)
          ?.map((e) => BillersList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HealthinputfieldsResponseModelToJson(
        HealthinputfieldsResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'billers': instance.billers,
    };

BillersList _$BillersListFromJson(Map<String, dynamic> json) => BillersList(
      id: json['id'] as String?,
      paramName: json['paramName'] as String?,
      dataType: json['dataType'] as String?,
      billerId: json['billerId'] as String?,
      minLength: json['minLength'] as String?,
    )..maxLength = json['maxLength'] as String?;

Map<String, dynamic> _$BillersListToJson(BillersList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'billerId': instance.billerId,
      'paramName': instance.paramName,
      'dataType': instance.dataType,
      'minLength': instance.minLength,
      'maxLength': instance.maxLength,
    };
