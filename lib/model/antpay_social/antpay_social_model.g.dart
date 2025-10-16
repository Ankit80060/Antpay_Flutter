// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'antpay_social_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AntpaySocialNewsModel _$AntpaySocialNewsModelFromJson(
        Map<String, dynamic> json) =>
    AntpaySocialNewsModel(
      status: (json['status'] as num).toInt(),
      list: (json['list'] as List<dynamic>)
          .map((e) => AntpaySocialNewsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      msg: json['msg'] as String,
    );

Map<String, dynamic> _$AntpaySocialNewsModelToJson(
        AntpaySocialNewsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'list': instance.list,
      'msg': instance.msg,
    };

AntpaySocialNewsItem _$AntpaySocialNewsItemFromJson(
        Map<String, dynamic> json) =>
    AntpaySocialNewsItem(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      website: json['website'] as String,
      img: json['img'] as String,
      url: json['url'] as String,
      status: json['status'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$AntpaySocialNewsItemToJson(
        AntpaySocialNewsItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'website': instance.website,
      'img': instance.img,
      'url': instance.url,
      'status': instance.status,
      'created_at': instance.createdAt,
    };
