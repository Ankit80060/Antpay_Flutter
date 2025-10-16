// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_otp_gift_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetGiftOtpResponse _$GetGiftOtpResponseFromJson(Map<String, dynamic> json) =>
    GetGiftOtpResponse(
      status: json['status'],
      msg: json['msg'] as String,
    );

Map<String, dynamic> _$GetGiftOtpResponseToJson(GetGiftOtpResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
    };

GetVerifyGiftOtpResponse _$GetVerifyGiftOtpResponseFromJson(
        Map<String, dynamic> json) =>
    GetVerifyGiftOtpResponse(
      status: json['status'] as String,
      msg: json['msg'] as String,
    );

Map<String, dynamic> _$GetVerifyGiftOtpResponseToJson(
        GetVerifyGiftOtpResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
    };
