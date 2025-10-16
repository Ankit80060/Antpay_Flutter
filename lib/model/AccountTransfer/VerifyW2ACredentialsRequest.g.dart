// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VerifyW2ACredentialsRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyW2ACredentialsRequest _$VerifyW2ACredentialsRequestFromJson(
        Map<String, dynamic> json) =>
    VerifyW2ACredentialsRequest(
      mobileNumber: json['customerMobile'] as String?,
      aParam: json['aParam'] as String?,
      deviceId: json['deviceId'] as String?,
      mpin: json['mpin'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$VerifyW2ACredentialsRequestToJson(
        VerifyW2ACredentialsRequest instance) =>
    <String, dynamic>{
      'customerMobile': instance.mobileNumber,
      'aParam': instance.aParam,
      'deviceId': instance.deviceId,
      'mpin': instance.mpin,
      'token': instance.token,
    };
