import 'package:json_annotation/json_annotation.dart';

part 'complain_status_bean.g.dart';

@JsonSerializable()
class ComplainStatusBean {
  @JsonKey(name: "status")
  int? status; // Changed to int? to match API response

  @JsonKey(name: "complain_id")
  String? complainId; // Renamed to camelCase for Dart convention

  @JsonKey(name: "complain_date")
  String? complainDate;

  @JsonKey(name: "complain_status")
  String? complainStatus;

  @JsonKey(name: "message")
  String? message;

  ComplainStatusBean({
    this.status,
    this.complainId,
    this.complainDate,
    this.complainStatus,
    this.message,
  });

  factory ComplainStatusBean.fromJson(Map<String, dynamic> json) =>
      _$ComplainStatusBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ComplainStatusBeanToJson(this);
}
