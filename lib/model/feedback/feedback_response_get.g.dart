// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_response_get.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackResponseGet _$FeedbackResponseGetFromJson(Map<String, dynamic> json) =>
    FeedbackResponseGet(
      userData: (json['UserData'] as List<dynamic>)
          .map((e) => UserFeedbackEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FeedbackResponseGetToJson(
        FeedbackResponseGet instance) =>
    <String, dynamic>{
      'UserData': instance.userData,
    };

UserFeedbackEntry _$UserFeedbackEntryFromJson(Map<String, dynamic> json) =>
    UserFeedbackEntry(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      userFeedback: json['user_feedback'] as String,
      createdDate: json['created_date'] as String,
    );

Map<String, dynamic> _$UserFeedbackEntryToJson(UserFeedbackEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'user_feedback': instance.userFeedback,
      'created_date': instance.createdDate,
    };
