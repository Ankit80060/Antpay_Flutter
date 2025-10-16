import 'package:json_annotation/json_annotation.dart';

part 'feedback_response_get.g.dart';

@JsonSerializable()
class FeedbackResponseGet {
  @JsonKey(name: 'UserData')
  final List<UserFeedbackEntry> userData;

  FeedbackResponseGet({required this.userData});

  factory FeedbackResponseGet.fromJson(Map<String, dynamic> json) =>
      _$FeedbackResponseGetFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackResponseGetToJson(this);
}

@JsonSerializable()
class UserFeedbackEntry {
  final String id;

  @JsonKey(name: 'user_id')
  final String userId;

  @JsonKey(name: 'user_feedback')
  final String userFeedback;

  @JsonKey(name: 'created_date')
  final String createdDate;

  UserFeedbackEntry({
    required this.id,
    required this.userId,
    required this.userFeedback,
    required this.createdDate,
  });

  factory UserFeedbackEntry.fromJson(Map<String, dynamic> json) =>
      _$UserFeedbackEntryFromJson(json);

  Map<String, dynamic> toJson() => _$UserFeedbackEntryToJson(this);
}
