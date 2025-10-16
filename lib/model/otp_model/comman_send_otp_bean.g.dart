// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comman_send_otp_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonSendOtpRequestModel _$CommonSendOtpRequestModelFromJson(
        Map<String, dynamic> json) =>
    CommonSendOtpRequestModel(
      mobile: json['mobile'] as String?,
      service: json['service'] as String?,
      aParam: json['aParam'] as String?,
    );

Map<String, dynamic> _$CommonSendOtpRequestModelToJson(
        CommonSendOtpRequestModel instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'service': instance.service,
      'aParam': instance.aParam,
    };

CommonSendOtpResponseModel _$CommonSendOtpResponseModelFromJson(
        Map<String, dynamic> json) =>
    CommonSendOtpResponseModel(
      status: (json['status'] as num?)?.toInt(),
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$CommonSendOtpResponseModelToJson(
        CommonSendOtpResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
    };
