// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comman_otpVerify_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommanUserOtpVerifyRequestModel _$CommanUserOtpVerifyRequestModelFromJson(
        Map<String, dynamic> json) =>
    CommanUserOtpVerifyRequestModel(
      mobile: json['mobile'] as String?,
      otp: json['otp'] as String?,
      service: json['service'] as String?,
    );

Map<String, dynamic> _$CommanUserOtpVerifyRequestModelToJson(
        CommanUserOtpVerifyRequestModel instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'otp': instance.otp,
      'service': instance.service,
    };

CommanUserOtpVerifyResponseModel _$CommanUserOtpVerifyResponseModelFromJson(
        Map<String, dynamic> json) =>
    CommanUserOtpVerifyResponseModel(
      status: (json['status'] as num?)?.toInt(),
      oathToken: json['oath_token'] as String?,
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$CommanUserOtpVerifyResponseModelToJson(
        CommanUserOtpVerifyResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'oath_token': instance.oathToken,
      'msg': instance.msg,
    };
