// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnouncementRequestModel _$AnnouncementRequestModelFromJson(
        Map<String, dynamic> json) =>
    AnnouncementRequestModel(
      mobile: json['mobile'] as String?,
      source: json['source'] as String?,
      aParam: json['aParam'] as String?,
    );

Map<String, dynamic> _$AnnouncementRequestModelToJson(
        AnnouncementRequestModel instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'source': instance.source,
      'aParam': instance.aParam,
    };

AnnouncementResponseModel _$AnnouncementResponseModelFromJson(
        Map<String, dynamic> json) =>
    AnnouncementResponseModel(
      status: json['status'],
      msg: json['msg'] as String?,
      announcementList: (json['announcement_list'] as List<dynamic>?)
          ?.map((e) => AnnouncementList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnnouncementResponseModelToJson(
        AnnouncementResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'announcement_list': instance.announcementList,
    };

AnnouncementList _$AnnouncementListFromJson(Map<String, dynamic> json) =>
    AnnouncementList(
      imgUrl: json['img_url'],
      title: json['title'] as String?,
      createdDate: json['created_date'] as String?,
    );

Map<String, dynamic> _$AnnouncementListToJson(AnnouncementList instance) =>
    <String, dynamic>{
      'img_url': instance.imgUrl,
      'title': instance.title,
      'created_date': instance.createdDate,
    };
