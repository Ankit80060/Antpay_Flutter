import 'package:json_annotation/json_annotation.dart';

part 'customer_load_balance.g.dart';
@JsonSerializable()
class CustomerLoadbalanceRequest {

  @JsonKey(name: "aParam")
  final String? aParam;

  @JsonKey(name: 'payu_response')
  final String? payuResponse;
  final String? messageCode;
  final String? clientTxnId;
  final String? requestDateTime;
  final String? customerId;
  final String? accountNumber;
  final int? transactionAmount;
  final String? sender;
  final String? loadCurrency;
  final int? sourceType;
  final String? sourceAccount;
  final String? originalClientTxnId;
  final String? fundFlowType;
  final String? implId;
  final String? implType;

  final String? refundFileId;
  final int? fee;

  @JsonKey(name: 'ant_txn_id')
  final String? antTxnId;

  @JsonKey(name: 'tag_name')
  final String? tagName;

  final String? mobile;
  final String? remark;

  @JsonKey(name: 'payment_method')
  final String? paymentMethod;

  final int? transactionResult;

  @JsonKey(name: 'transaction_type')
  final String? transactionType;

  final String? pgNo;

  CustomerLoadbalanceRequest({
    this.messageCode,
    this.clientTxnId,
    this.requestDateTime,
    this.customerId,
    this.accountNumber,
    this.transactionAmount,
    this.sender,
    this.loadCurrency,
    this.sourceType,
    this.sourceAccount,
    this.originalClientTxnId,
    this.fundFlowType,
    this.implId,
    this.implType,
    this.refundFileId,
    this.fee,
    this.antTxnId,
    this.tagName,
    this.mobile,
    this.remark,
    this.paymentMethod,
    this.payuResponse,
    this.transactionResult,
    this.transactionType,
    this.pgNo,
    this.aParam,
  });

  factory CustomerLoadbalanceRequest.fromJson(Map<String, dynamic> json) =>
      _$CustomerLoadbalanceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerLoadbalanceRequestToJson(this);
}

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

