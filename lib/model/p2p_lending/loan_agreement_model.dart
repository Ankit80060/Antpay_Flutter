import 'package:json_annotation/json_annotation.dart';

part 'loan_agreement_model.g.dart';

@JsonSerializable()
class LoanAgreementResponse {
  LoanAgreementResponse({
    this.status,
    this.agreement,
  });

  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'agreement')
  String? agreement;

  factory LoanAgreementResponse.fromJson(Map<String, dynamic> json) =>
      _$LoanAgreementResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoanAgreementResponseToJson(this);
}
