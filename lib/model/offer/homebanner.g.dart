// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homebanner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomebannerModel _$HomebannerModelFromJson(Map<String, dynamic> json) =>
    HomebannerModel(
      status: json['status'],
      msg: json['msg'] as String?,
      banner_list: (json['banner_list'] as List<dynamic>?)
          ?.map((e) => Bannerlist.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomebannerModelToJson(HomebannerModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'banner_list': instance.banner_list,
    };

Bannerlist _$BannerlistFromJson(Map<String, dynamic> json) => Bannerlist(
      id: json['id'],
      banner_name: json['banner_name'],
      banner_img: json['banner_img'],
      app_page: json['app_page'],
      web_url: json['web_url'],
      status: json['status'],
      expired_at: json['expired_at'],
    );

Map<String, dynamic> _$BannerlistToJson(Bannerlist instance) =>
    <String, dynamic>{
      'id': instance.id,
      'banner_name': instance.banner_name,
      'banner_img': instance.banner_img,
      'app_page': instance.app_page,
      'web_url': instance.web_url,
      'status': instance.status,
      'expired_at': instance.expired_at,
    };
