// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_name_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsernameRequest _$UsernameRequestFromJson(Map<String, dynamic> json) =>
    UsernameRequest(
      mobile: json['mobile'] as String?,
    );

Map<String, dynamic> _$UsernameRequestToJson(UsernameRequest instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
    };

UsernameResponse _$UsernameResponseFromJson(Map<String, dynamic> json) =>
    UsernameResponse(
      lname: json['lname'] as String?,
      fname: json['fname'] as String?,
      status: json['status'] as String?,
      msg: json['msg'] as String?,
      encryptedName: json['encryptedName'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$UsernameResponseToJson(UsernameResponse instance) =>
    <String, dynamic>{
      'lname': instance.lname,
      'name': instance.name,
      'status': instance.status,
      'msg': instance.msg,
      'encryptedName': instance.encryptedName,
      'fname': instance.fname,
    };
