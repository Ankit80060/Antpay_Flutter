// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReminderRequest _$ReminderRequestFromJson(Map<String, dynamic> json) =>
    ReminderRequest(
      mobile: json['mobile'] as String,
      date: json['date'] as String,
      aParam: json['aParam'] as String,
    );

Map<String, dynamic> _$ReminderRequestToJson(ReminderRequest instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'date': instance.date,
      'aParam': instance.aParam,
    };
