// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redemption_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RedemptionStatusRequestModel _$RedemptionStatusRequestModelFromJson(
        Map<String, dynamic> json) =>
    RedemptionStatusRequestModel(
      phone: json['phone'] as String?,
      investment_no: json['investment_no'] as String?,
      source: json['source'] as String?,
    );

Map<String, dynamic> _$RedemptionStatusRequestModelToJson(
        RedemptionStatusRequestModel instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'investment_no': instance.investment_no,
      'source': instance.source,
    };

RedemptionStatusResponseModel _$RedemptionStatusResponseModelFromJson(
        Map<String, dynamic> json) =>
    RedemptionStatusResponseModel(
      status: json['status'],
      message: json['mes'] as String?,
    );

Map<String, dynamic> _$RedemptionStatusResponseModelToJson(
        RedemptionStatusResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'mes': instance.message,
    };
