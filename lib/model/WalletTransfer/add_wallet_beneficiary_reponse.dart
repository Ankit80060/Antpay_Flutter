import 'package:json_annotation/json_annotation.dart';

part 'add_wallet_beneficiary_reponse.g.dart';

@JsonSerializable()
class WalletAddBenefiaryResponseModel {
  @JsonKey(name: "urn")
  int? urn;

  @JsonKey(name: "customerId")
  String? customerId;

  @JsonKey(name: "responseCode")
  String? responseCode;

  @JsonKey(name: "messageCode")
  int? messageCode;

  @JsonKey(name: "clientTxnId")
  String? clientTxnId;

  @JsonKey(name: "clientId")
  String? clientId;

  @JsonKey(name: "responseDateTime")
  String? responseDateTime;

  @JsonKey(name: "accosaTransactionId")
  int? accosaTransactionId;

  @JsonKey(name: "responseMessage")
  String? responseMessage;

  @JsonKey(name: "bankId")
  int? bankId;

  @JsonKey(name: "beneficiaryId")
  int? beneficiaryId;

  @JsonKey(name: "beneficiaryTypeCode")
  int? beneficiaryTypeCode;

  WalletAddBenefiaryResponseModel({
    this.urn,
    this.customerId,
    this.responseCode,
    this.messageCode,
    this.clientTxnId,
    this.clientId,
    this.responseDateTime,
    this.accosaTransactionId,
    this.responseMessage,
    this.bankId,
    this.beneficiaryId,
    this.beneficiaryTypeCode,
  });

  factory WalletAddBenefiaryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WalletAddBenefiaryResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$WalletAddBenefiaryResponseModelToJson(this);
}
