import 'package:json_annotation/json_annotation.dart';

part 'CustomerFundTransferResponse.g.dart';

@JsonSerializable()
class CustomerFundTransferResponse {
  @JsonKey(name: 'responseCode')
  final String? responseCode;

  @JsonKey(name: 'messageCode')
  final int? messageCode;

  @JsonKey(name: 'clientTxnId')
  final String? clientTxnId;

  @JsonKey(name: 'clientId')
  final String? clientId;

  @JsonKey(name: 'responseDateTime')
  final String? responseDateTime;

  @JsonKey(name: 'accosaTransactionId')
  final int? accosaTransactionId;

  @JsonKey(name: 'responseMessage')
  final String? responseMessage;

  @JsonKey(name: 'bankId')
  final int? bankId;

  @JsonKey(name: 'transactionAmount')
  final int? transactionAmount;

  @JsonKey(name: 'senders')
  final List<Sender>? senders;

  @JsonKey(name: 'receivers')
  final List<Receiver>? receivers;

  CustomerFundTransferResponse({
    this.responseCode,
    this.messageCode,
    this.clientTxnId,
    this.clientId,
    this.responseDateTime,
    this.accosaTransactionId,
    this.responseMessage,
    this.bankId,
    this.transactionAmount,
    this.senders,
    this.receivers,
  });

  factory CustomerFundTransferResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerFundTransferResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerFundTransferResponseToJson(this);
}


@JsonSerializable()
class Receiver {
  @JsonKey(name: 'urn')
  final int? urn;

  @JsonKey(name: 'customerId')
  final String? customerId;

  @JsonKey(name: 'accosaRefNo')
  final int? accosaRefNo;

  @JsonKey(name: 'availableBalance')
  final int? availableBalance;

  @JsonKey(name: 'transactionAmount')
  final int? transactionAmount;

  Receiver({
    this.urn,
    this.customerId,
    this.accosaRefNo,
    this.availableBalance,
    this.transactionAmount,
  });

  factory Receiver.fromJson(Map<String, dynamic> json) =>
      _$ReceiverFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiverToJson(this);
}

@JsonSerializable()
class Sender {
  @JsonKey(name: 'urn')
  final int? urn;

  @JsonKey(name: 'customerId')
  final String? customerId;

  @JsonKey(name: 'accosaRefNo')
  final int? accosaRefNo;

  @JsonKey(name: 'availableBalance')
  final int? availableBalance;

  @JsonKey(name: 'transactionAmount')
  final int? transactionAmount;

  Sender({
    this.urn,
    this.customerId,
    this.accosaRefNo,
    this.availableBalance,
    this.transactionAmount,
  });

  factory Sender.fromJson(Map<String, dynamic> json) => _$SenderFromJson(json);

  Map<String, dynamic> toJson() => _$SenderToJson(this);
}





