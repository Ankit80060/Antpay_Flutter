// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfilePicRequest _$ProfilePicRequestFromJson(Map<String, dynamic> json) =>
    ProfilePicRequest(
      mobile: json['mobile'] as String,
      aParam: json['aParam'] as String,
    );

Map<String, dynamic> _$ProfilePicRequestToJson(ProfilePicRequest instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'aParam': instance.aParam,
    };

ProfilePicResponse _$ProfilePicResponseFromJson(Map<String, dynamic> json) =>
    ProfilePicResponse(
      status: json['status'] as String,
      pic: json['pic'] as String?,
      msg: json['msg'] as String,
    );

Map<String, dynamic> _$ProfilePicResponseToJson(ProfilePicResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'pic': instance.pic,
      'msg': instance.msg,
    };
