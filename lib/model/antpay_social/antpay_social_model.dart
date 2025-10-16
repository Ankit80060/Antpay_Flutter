import 'package:json_annotation/json_annotation.dart';
part 'antpay_social_model.g.dart';

@JsonSerializable()
class AntpaySocialNewsModel {
  final int status;
  final List<AntpaySocialNewsItem> list;
  final String msg;

  AntpaySocialNewsModel({
    required this.status,
    required this.list,
    required this.msg,
  });

  factory AntpaySocialNewsModel.fromJson(Map<String, dynamic> json) =>
      _$AntpaySocialNewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AntpaySocialNewsModelToJson(this);
}

@JsonSerializable()
class AntpaySocialNewsItem {
  final String id;
  final String title;
  final String description;
  final String website;
  final String img;
  final String url;
  final String status;
  @JsonKey(name: 'created_at')
  final String createdAt;

  AntpaySocialNewsItem({
    required this.id,
    required this.title,
    required this.description,
    required this.website,
    required this.img,
    required this.url,
    required this.status,
    required this.createdAt,
  });

  factory AntpaySocialNewsItem.fromJson(Map<String, dynamic> json) =>
      _$AntpaySocialNewsItemFromJson(json);

  Map<String, dynamic> toJson() => _$AntpaySocialNewsItemToJson(this);
}
