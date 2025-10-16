import 'package:json_annotation/json_annotation.dart';

part 'social_video_model.g.dart';

@JsonSerializable()
class SocialVideoModel {
  final int status;
  final String msg;

  @JsonKey(name: "single_video")
  final YoutubeVideo? singleVideo;

  @JsonKey(name: "video_list")
  final List<YoutubeVideo>? videoList;

  SocialVideoModel({
    required this.status,
    required this.msg,
    this.singleVideo,
    this.videoList,
  });

  factory SocialVideoModel.fromJson(Map<String, dynamic> json) =>
      _$SocialVideoModelFromJson(json);

  Map<String, dynamic> toJson() => _$SocialVideoModelToJson(this);
}

@JsonSerializable()
class YoutubeVideo {
  final String url;
  final String thumbnailImage;
  final String title;

  YoutubeVideo({
    required this.url,
    required this.thumbnailImage,
    required this.title,
  });

  factory YoutubeVideo.fromJson(Map<String, dynamic> json) =>
      _$YoutubeVideoFromJson(json);

  Map<String, dynamic> toJson() => _$YoutubeVideoToJson(this);
}
