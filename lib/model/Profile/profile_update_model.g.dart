// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_update_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileUpdateRequestModel _$ProfileUpdateRequestModelFromJson(
        Map<String, dynamic> json) =>
    ProfileUpdateRequestModel(
      aParam: json['aParam'] as String?,
      company_name: json['company_name'] as String?,
      dob: json['dob'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      income: json['income'] as String?,
      invest_in_equity_market_flag:
          json['invest_in_equity_market_flag'] as String?,
      marital_status: json['marital_status'] as String?,
      mobile: json['mobile'] as String?,
      name: json['name'] as String?,
      occupation: json['occupation'] as String?,
      own_house_motor_flag: json['own_house_motor_flag'] as String?,
      profile_img: json['profile_img'] as String?,
      qualification: json['qualification'] as String?,
    );

Map<String, dynamic> _$ProfileUpdateRequestModelToJson(
        ProfileUpdateRequestModel instance) =>
    <String, dynamic>{
      'aParam': instance.aParam,
      'company_name': instance.company_name,
      'dob': instance.dob,
      'email': instance.email,
      'gender': instance.gender,
      'income': instance.income,
      'invest_in_equity_market_flag': instance.invest_in_equity_market_flag,
      'marital_status': instance.marital_status,
      'mobile': instance.mobile,
      'name': instance.name,
      'occupation': instance.occupation,
      'own_house_motor_flag': instance.own_house_motor_flag,
      'profile_img': instance.profile_img,
      'qualification': instance.qualification,
    };

ProfileUpdateResponseModel _$ProfileUpdateResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProfileUpdateResponseModel(
      status: json['status'],
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$ProfileUpdateResponseModelToJson(
        ProfileUpdateResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
    };
