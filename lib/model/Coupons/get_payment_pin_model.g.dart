// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_payment_pin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPaymentPinResponse _$GetPaymentPinResponseFromJson(
        Map<String, dynamic> json) =>
    GetPaymentPinResponse(
      status: json['status'] as String,
      pin: json['pin'] as String,
      msg: json['msg'] as String,
    );

Map<String, dynamic> _$GetPaymentPinResponseToJson(
        GetPaymentPinResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'pin': instance.pin,
      'msg': instance.msg,
    };
