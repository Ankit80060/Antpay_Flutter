// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReminderResponse _$ReminderResponseFromJson(Map<String, dynamic> json) =>
    ReminderResponse(
      status: json['status'] as String,
      date: json['date'] as String,
      msg: json['msg'] as String,
    );

Map<String, dynamic> _$ReminderResponseToJson(ReminderResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'date': instance.date,
      'msg': instance.msg,
    };
