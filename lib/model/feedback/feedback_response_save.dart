import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'feedback_response_save.g.dart';

@JsonSerializable()
class FeedbackResponseSave {
  final String status;

  FeedbackResponseSave({required this.status});
  factory FeedbackResponseSave.fromJson(dynamic json) {
    if (json is String) {
      final Map<String, dynamic> map = jsonDecode(json);
      return FeedbackResponseSave(status: map['status'] ?? '');
    } else if (json is Map<String, dynamic>) {
      return _$FeedbackResponseSaveFromJson(json);
    } else {
      throw Exception("Unexpected response type: ${json.runtimeType}");
    }
  }

  Map<String, dynamic> toJson() => _$FeedbackResponseSaveToJson(this);
}
