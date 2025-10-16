// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AddBeneOtplRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddBeneOtplRequest _$AddBeneOtplRequestFromJson(Map<String, dynamic> json) =>
    AddBeneOtplRequest(
      aParam: json['aParam'] as String?,
      service: json['service'] as String?,
      mobile: json['mobile'] as String?,
      otp: json['otp'] as String?,
    );

Map<String, dynamic> _$AddBeneOtplRequestToJson(AddBeneOtplRequest instance) =>
    <String, dynamic>{
      'aParam': instance.aParam,
      'service': instance.service,
      'mobile': instance.mobile,
      'otp': instance.otp,
    };
