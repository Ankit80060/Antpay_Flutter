import 'package:json_annotation/json_annotation.dart';

part 'CustomerLoadbalanceResponse.g.dart';

@JsonSerializable()
class CustomerLoadbalanceResponse {
  final int? urn;
  final String? customerId;
  final String? responseCode;
  final int? messageCode;
  final String? clientTxnId;
  final String? responseDateTime;
  final int? accosaTransactionId;
  final String? responseMessage;
  final String? accosaRefNo;
  final int? availableBalance;
  final int? availableCashLimit;
  final int? transactionAmount;

  CustomerLoadbalanceResponse({
    this.urn,
    this.customerId,
    this.responseCode,
    this.messageCode,
    this.clientTxnId,
    this.responseDateTime,
    this.accosaTransactionId,
    this.responseMessage,
    this.accosaRefNo,
    this.availableBalance,
    this.availableCashLimit,
    this.transactionAmount,
  });

  factory CustomerLoadbalanceResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerLoadbalanceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerLoadbalanceResponseToJson(this);
}
