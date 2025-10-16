import 'package:json_annotation/json_annotation.dart';

part 'reminder_response.g.dart';

@JsonSerializable()
class ReminderResponse {
  final String status;
  final String date;
  final String msg;

  ReminderResponse({
    required this.status,
    required this.date,
    required this.msg,
  });

  factory ReminderResponse.fromJson(Map<String, dynamic> json) => _$ReminderResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ReminderResponseToJson(this);
}
