import 'package:json_annotation/json_annotation.dart';

part 'customer_account_beneficiary_response.g.dart';

@JsonSerializable()
class CustomerAccountBeneficiaryResponse {
  @JsonKey(name: 'customerId')
  final String? customerId;

  @JsonKey(name: 'responseCode')
  final String? responseCode;

  @JsonKey(name: 'messageCode')
  final int? messageCode;

  @JsonKey(name: 'clientTxnId')
  final String? clientTxnId;

  @JsonKey(name: 'responseDateTime')
  final String? responseDateTime;

  @JsonKey(name: 'responseMessage')
  final String? responseMessage;

  @JsonKey(name: 'accosaRefNo')
  final String? accosaRefNo;

  @JsonKey(name: 'token')
  final String? token;

  @JsonKey(name: 'beneficiaryID')
  final String? beneficiaryID;

  @JsonKey(name: 'accountNumber')
  final String? accountNumber;

  @JsonKey(name: 'beneficiaryName')
  final String? beneficiaryName;

  @JsonKey(name: 'transactionAmount')
  final int? transactionAmount;

  @JsonKey(name: 'transactionId')
  final String? transactionId;

  @JsonKey(name: 'metaDataStatus')
  final String? metaDataStatus;

  @JsonKey(name: 'resourceDataStatus')
  final String? resourceDataStatus;

  @JsonKey(name: 'transactionReferenceNo')
  final String? transactionReferenceNo;

  @JsonKey(name: 'status')
  final int? status;

  @JsonKey(name: 'msg')
  final String? msg;

  @JsonKey(name: 'reason')
  final String? reason;

  CustomerAccountBeneficiaryResponse({
    this.customerId,
    this.responseCode,
    this.messageCode,
    this.clientTxnId,
    this.responseDateTime,
    this.responseMessage,
    this.accosaRefNo,
    this.token,
    this.beneficiaryID,
    this.accountNumber,
    this.beneficiaryName,
    this.transactionAmount,
    this.transactionId,
    this.metaDataStatus,
    this.resourceDataStatus,
    this.transactionReferenceNo,
    this.status,
    this.msg,
    this.reason,
  });

  factory CustomerAccountBeneficiaryResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerAccountBeneficiaryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerAccountBeneficiaryResponseToJson(this);
}
