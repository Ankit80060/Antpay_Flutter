// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_personal_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPersonalDetailsRequestModel _$UserPersonalDetailsRequestModelFromJson(
        Map<String, dynamic> json) =>
    UserPersonalDetailsRequestModel(
      device_id: json['device_id'] as String?,
      app_version: json['app_version'] as String?,
      DOB: json['DOB'] as String?,
      email: json['email'] as String?,
      fullname: json['fullname'] as String?,
      gender: json['gender'] as String?,
      pan: json['PAN'] as String?,
      phone: json['phone'] as String?,
      vendor_id: json['vendor_id'] as String?,
      source: json['source'] as String?,
    );

Map<String, dynamic> _$UserPersonalDetailsRequestModelToJson(
        UserPersonalDetailsRequestModel instance) =>
    <String, dynamic>{
      'device_id': instance.device_id,
      'app_version': instance.app_version,
      'DOB': instance.DOB,
      'email': instance.email,
      'fullname': instance.fullname,
      'gender': instance.gender,
      'PAN': instance.pan,
      'phone': instance.phone,
      'vendor_id': instance.vendor_id,
      'source': instance.source,
    };

UserPersonalDetailsResponseModel _$UserPersonalDetailsResponseModelFromJson(
        Map<String, dynamic> json) =>
    UserPersonalDetailsResponseModel(
      status: json['status'],
      user_id: (json['user_id'] as num?)?.toInt(),
      lender_id: json['lender_id'] as String?,
      authorization: json['Authorization'] as String?,
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$UserPersonalDetailsResponseModelToJson(
        UserPersonalDetailsResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'user_id': instance.user_id,
      'lender_id': instance.lender_id,
      'Authorization': instance.authorization,
      'msg': instance.msg,
    };
