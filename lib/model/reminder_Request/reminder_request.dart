import 'package:json_annotation/json_annotation.dart';

part 'reminder_request.g.dart';

@JsonSerializable()
class ReminderRequest {
  final String mobile;
  final String date;
  final String aParam;

  ReminderRequest({
    required this.mobile,
    required this.date,
    required this.aParam,
  });

  factory ReminderRequest.fromJson(Map<String, dynamic> json) => _$ReminderRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ReminderRequestToJson(this);
}
