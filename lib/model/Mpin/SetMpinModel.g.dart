// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SetMpinModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetMPinResponse _$SetMPinResponseFromJson(Map<String, dynamic> json) =>
    SetMPinResponse(
      responseCode: json['responseCode'] as String,
      messageCode: const StringConverter().fromJson(json['messageCode']),
      clientTxnId: json['clientTxnId'] as String,
      responseDateTime: json['responseDateTime'] as String,
      responseMessage: json['responseMessage'] as String,
      token: const StringConverter().fromJson(json['token']),
      deviceId: const StringConverter().fromJson(json['deviceId']),
      tokenExpiryTime:
          const StringConverter().fromJson(json['tokenExpiryTime']),
      mpinExpiryTime: const StringConverter().fromJson(json['mpinExpiryTime']),
    );

Map<String, dynamic> _$SetMPinResponseToJson(SetMPinResponse instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'messageCode': const StringConverter().toJson(instance.messageCode),
      'clientTxnId': instance.clientTxnId,
      'responseDateTime': instance.responseDateTime,
      'responseMessage': instance.responseMessage,
      'token': const StringConverter().toJson(instance.token),
      'deviceId': const StringConverter().toJson(instance.deviceId),
      'tokenExpiryTime':
          const StringConverter().toJson(instance.tokenExpiryTime),
      'mpinExpiryTime': const StringConverter().toJson(instance.mpinExpiryTime),
    };

SetMPinRequest _$SetMPinRequestFromJson(Map<String, dynamic> json) =>
    SetMPinRequest(
      aParam: json['aParam'] as String,
      customerMobile: json['customerMobile'] as String,
      newMpin: json['newMpin'] as String,
      oldMPin: json['oldMPin'] as String,
      otp: json['otp'] as String,
      action: json['action'] as String,
      deviceId: json['deviceId'] as String,
    );

Map<String, dynamic> _$SetMPinRequestToJson(SetMPinRequest instance) =>
    <String, dynamic>{
      'customerMobile': instance.customerMobile,
      'newMpin': instance.newMpin,
      'oldMPin': instance.oldMPin,
      'otp': instance.otp,
      'action': instance.action,
      'deviceId': instance.deviceId,
      'aParam': instance.aParam,
    };
