// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_request_get.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackRequestGet _$FeedbackRequestGetFromJson(Map<String, dynamic> json) =>
    FeedbackRequestGet(
      userData: UserDataGet.fromJson(json['userData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeedbackRequestGetToJson(FeedbackRequestGet instance) =>
    <String, dynamic>{
      'userData': instance.userData,
    };

UserDataGet _$UserDataGetFromJson(Map<String, dynamic> json) => UserDataGet(
      mobile: json['mobile'] as String,
      aParam: json['aParam'] as String,
    );

Map<String, dynamic> _$UserDataGetToJson(UserDataGet instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'aParam': instance.aParam,
    };
