// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lender_kyc_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LenderKycStatusRequestModel _$LenderKycStatusRequestModelFromJson(
        Map<String, dynamic> json) =>
    LenderKycStatusRequestModel(
      phone: json['phone'] as String?,
      source: json['source'] as String?,
    );

Map<String, dynamic> _$LenderKycStatusRequestModelToJson(
        LenderKycStatusRequestModel instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'source': instance.source,
    };

LenderKycStatusResponseModel _$LenderKycStatusResponseModelFromJson(
        Map<String, dynamic> json) =>
    LenderKycStatusResponseModel(
      status: json['status'],
      kyc_status: json['kyc_status'] == null
          ? null
          : LenderKycStatus.fromJson(
              json['kyc_status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LenderKycStatusResponseModelToJson(
        LenderKycStatusResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'kyc_status': instance.kyc_status,
    };

LenderKycStatus _$LenderKycStatusFromJson(Map<String, dynamic> json) =>
    LenderKycStatus(
      lender_id: json['lender_id'] as String?,
      step: json['step'],
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$LenderKycStatusToJson(LenderKycStatus instance) =>
    <String, dynamic>{
      'lender_id': instance.lender_id,
      'step': instance.step,
      'msg': instance.msg,
    };
