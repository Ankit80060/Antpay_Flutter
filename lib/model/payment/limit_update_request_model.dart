import 'package:json_annotation/json_annotation.dart';

part 'limit_update_request_model.g.dart';

@JsonSerializable()
class LimitUpdateRequest {
  final String id;
  final String perTxnLimit;
  final String dailyLimit;
  final String monthlyLimit;
  final String yearlyLimit;
  final String limitUpdateId;
  final String aParam;

  LimitUpdateRequest({
    required this.id,
    required this.perTxnLimit,
    required this.dailyLimit,
    required this.monthlyLimit,
    required this.yearlyLimit,
    this.limitUpdateId = "-1",
    required this.aParam,
  });

  factory LimitUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$LimitUpdateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LimitUpdateRequestToJson(this);
}

// Response Model

@JsonSerializable()
class LimitUpdateResponse {
  final int responseCode;
  final String responseMessage;
  final String responseDateTime;

  LimitUpdateResponse({
    required this.responseCode,
    required this.responseMessage,
    required this.responseDateTime,
  });

  factory LimitUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$LimitUpdateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LimitUpdateResponseToJson(this);
}
