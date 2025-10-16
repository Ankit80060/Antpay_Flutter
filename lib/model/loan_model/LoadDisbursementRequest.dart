import 'package:json_annotation/json_annotation.dart';

part 'LoadDisbursementRequest.g.dart';

@JsonSerializable()
class LoadDisbursementRequest {
  @JsonKey(name: 'borrower_id')
  final String? borrowerId;

  @JsonKey(name: 'loan_id')
  final String? loanId;

  @JsonKey(name: 'service')
  final String? service;

  @JsonKey(name: 'channel')
  final String? channel;

  @JsonKey(name: 'mobile')
  final String? mobile;

  @JsonKey(name: 'amount')
  final String? amount;

  LoadDisbursementRequest({
    this.borrowerId,
    this.loanId,
    this.service,
    this.channel,
    this.mobile,
    this.amount,
  });

  /// Factory constructor to create an instance from JSON
  factory LoadDisbursementRequest.fromJson(Map<String, dynamic> json) =>
      _$LoadDisbursementRequestFromJson(json);

  /// Method to convert an instance to JSON
  Map<String, dynamic> toJson() => _$LoadDisbursementRequestToJson(this);
}
