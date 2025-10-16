import 'package:json_annotation/json_annotation.dart';

part 'feedback_request_save.g.dart';

@JsonSerializable()
class FeedbackRequestSave {
  @JsonKey(name: 'userData')
  final UserData userData;

  FeedbackRequestSave({required this.userData});

  factory FeedbackRequestSave.fromJson(Map<String, dynamic> json) =>
      _$FeedbackRequestSaveFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackRequestSaveToJson(this);
}

@JsonSerializable()
class UserData {
  final String mobile;

  @JsonKey(name: 'user_feedback')
  final String userFeedback;

  final String aParam;

  UserData({
    required this.mobile,
    required this.userFeedback,
    required this.aParam,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
