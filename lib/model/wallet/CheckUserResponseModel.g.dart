// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CheckUserResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckUserResponseModel _$CheckUserResponseModelFromJson(
        Map<String, dynamic> json) =>
    CheckUserResponseModel()
      ..code = json['code'] as String?
      ..statusCode = json['status_code'] as String?
      ..mobileNumber = json['mobile_number'] as String?
      ..kycStatus = json['kyc_status'] as String?
      ..walletStatus = json['wallet_status'] as String?
      ..message = json['message'] as String?
      ..name = json['name'] as String?
      ..dOB = json['DOB'] as String?
      ..address = json['address'] as String?;

Map<String, dynamic> _$CheckUserResponseModelToJson(
        CheckUserResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status_code': instance.statusCode,
      'mobile_number': instance.mobileNumber,
      'kyc_status': instance.kycStatus,
      'wallet_status': instance.walletStatus,
      'message': instance.message,
      'name': instance.name,
      'DOB': instance.dOB,
      'address': instance.address,
    };
