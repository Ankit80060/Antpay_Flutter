import 'package:json_annotation/json_annotation.dart';

part 'ppi_kyc_reg_user_response_model.g.dart';

@JsonSerializable()
class PpiRegisterUserResponse {
  final String? messageCode;
  final String? clientTxnId;
  final DateTime? responseDateTime;
  final String? responseCode;
  final String? responseMessage;
  final String? bankId;
  final String? clientId;
  final String? customerId;
  final String? accosaTransactionId;

  @JsonKey(name: "err_msg")
  final dynamic errMsg;

  final String? status;
  final Formfactor? formfactor;

  PpiRegisterUserResponse({
    this.messageCode,
    this.clientTxnId,
    this.responseDateTime,
    this.responseCode,
    this.responseMessage,
    this.bankId,
    this.clientId,
    this.customerId,
    this.accosaTransactionId,
    this.errMsg,
    this.status,
    this.formfactor,
  });

  factory PpiRegisterUserResponse.fromJson(Map<String, dynamic> json) =>
      _$PpiRegisterUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PpiRegisterUserResponseToJson(this);
}

@JsonSerializable()
class Formfactor {
  final String? cardNumber;
  final String? expiryDate;
  final String? cvv;

  Formfactor({
    this.cardNumber,
    this.expiryDate,
    this.cvv,
  });

  factory Formfactor.fromJson(Map<String, dynamic> json) =>
      _$FormfactorFromJson(json);

  Map<String, dynamic> toJson() => _$FormfactorToJson(this);
}
