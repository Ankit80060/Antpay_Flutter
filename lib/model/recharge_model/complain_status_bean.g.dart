// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complain_status_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplainStatusBean _$ComplainStatusBeanFromJson(Map<String, dynamic> json) =>
    ComplainStatusBean(
      status: (json['status'] as num?)?.toInt(),
      complainId: json['complain_id'] as String?,
      complainDate: json['complain_date'] as String?,
      complainStatus: json['complain_status'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ComplainStatusBeanToJson(ComplainStatusBean instance) =>
    <String, dynamic>{
      'status': instance.status,
      'complain_id': instance.complainId,
      'complain_date': instance.complainDate,
      'complain_status': instance.complainStatus,
      'message': instance.message,
    };
