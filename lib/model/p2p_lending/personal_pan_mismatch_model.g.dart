// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_pan_mismatch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalPanMisMatchRequestModel _$PersonalPanMisMatchRequestModelFromJson(
        Map<String, dynamic> json) =>
    PersonalPanMisMatchRequestModel(
      phone: json['phone'] as String?,
      lender_id: json['lender_id'] as String?,
      msg: json['msg'] as String?,
      source: json['source'] as String?,
    );

Map<String, dynamic> _$PersonalPanMisMatchRequestModelToJson(
        PersonalPanMisMatchRequestModel instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'lender_id': instance.lender_id,
      'msg': instance.msg,
      'source': instance.source,
    };

PersonalPanMisMatchResponseModel _$PersonalPanMisMatchResponseModelFromJson(
        Map<String, dynamic> json) =>
    PersonalPanMisMatchResponseModel(
      status: json['status'],
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$PersonalPanMisMatchResponseModelToJson(
        PersonalPanMisMatchResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
    };
