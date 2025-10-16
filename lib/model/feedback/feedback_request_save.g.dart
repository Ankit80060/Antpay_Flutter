// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_request_save.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackRequestSave _$FeedbackRequestSaveFromJson(Map<String, dynamic> json) =>
    FeedbackRequestSave(
      userData: UserData.fromJson(json['userData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeedbackRequestSaveToJson(
        FeedbackRequestSave instance) =>
    <String, dynamic>{
      'userData': instance.userData,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      mobile: json['mobile'] as String,
      userFeedback: json['user_feedback'] as String,
      aParam: json['aParam'] as String,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'mobile': instance.mobile,
      'user_feedback': instance.userFeedback,
      'aParam': instance.aParam,
    };
