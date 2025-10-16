import 'package:json_annotation/json_annotation.dart';

part 'credit_score_request_model.g.dart';

@JsonSerializable()
class CreditScoreRequest {
  final String fname;
  final String lname;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'aParam')
  final String aParam;
  @JsonKey(name: 'experian_source')
  final String experianSource;
  final String mobileNo;
  @JsonKey(name: 'creditScoreRequestType')
  final String creditScoreRequestType;

  CreditScoreRequest({
    required this.fname,
    required this.lname,
    required this.userId,
    required this.aParam,
    required this.experianSource,
    required this.mobileNo,
    required this.creditScoreRequestType,
  });

  factory CreditScoreRequest.fromJson(Map<String, dynamic> json) =>
      _$CreditScoreRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreditScoreRequestToJson(this);
}
