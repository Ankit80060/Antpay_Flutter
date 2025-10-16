import 'package:json_annotation/json_annotation.dart';

part 'feedback_request_get.g.dart';

@JsonSerializable()
class FeedbackRequestGet {
  @JsonKey(name: 'userData')
  final UserDataGet userData;

  FeedbackRequestGet({required this.userData});

  factory FeedbackRequestGet.fromJson(Map<String, dynamic> json) =>
      _$FeedbackRequestGetFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackRequestGetToJson(this);
}

@JsonSerializable()
class UserDataGet {
  final String mobile;
  final String aParam;

  UserDataGet({required this.mobile, required this.aParam});

  factory UserDataGet.fromJson(Map<String, dynamic> json) =>
      _$UserDataGetFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataGetToJson(this);
}
