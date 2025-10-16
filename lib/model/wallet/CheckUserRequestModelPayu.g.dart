// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CheckUserRequestModelPayu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckUserRequestModelPayu _$CheckUserRequestModelPayuFromJson(
        Map<String, dynamic> json) =>
    CheckUserRequestModelPayu(
      messageCode: json['messageCode'] as String?,
      clientTxnId: json['clientTxnId'] as String?,
      aParam: json['aParam'] as String?,
      customerMobile: json['customerMobile'] as String?,
    );

Map<String, dynamic> _$CheckUserRequestModelPayuToJson(
        CheckUserRequestModelPayu instance) =>
    <String, dynamic>{
      'messageCode': instance.messageCode,
      'clientTxnId': instance.clientTxnId,
      'aParam': instance.aParam,
      'customerMobile': instance.customerMobile,
    };
