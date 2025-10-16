// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialVideoModel _$SocialVideoModelFromJson(Map<String, dynamic> json) =>
    SocialVideoModel(
      status: (json['status'] as num).toInt(),
      msg: json['msg'] as String,
      singleVideo: json['single_video'] == null
          ? null
          : YoutubeVideo.fromJson(json['single_video'] as Map<String, dynamic>),
      videoList: (json['video_list'] as List<dynamic>?)
          ?.map((e) => YoutubeVideo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SocialVideoModelToJson(SocialVideoModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'single_video': instance.singleVideo,
      'video_list': instance.videoList,
    };

YoutubeVideo _$YoutubeVideoFromJson(Map<String, dynamic> json) => YoutubeVideo(
      url: json['url'] as String,
      thumbnailImage: json['thumbnailImage'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$YoutubeVideoToJson(YoutubeVideo instance) =>
    <String, dynamic>{
      'url': instance.url,
      'thumbnailImage': instance.thumbnailImage,
      'title': instance.title,
    };
