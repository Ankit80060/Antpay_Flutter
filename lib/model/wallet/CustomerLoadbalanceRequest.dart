import 'package:json_annotation/json_annotation.dart';

part 'CustomerLoadbalanceRequest.g.dart';
@JsonSerializable()
class CustomerLoadbalanceRequest {
  final String aParam;
  @JsonKey(name: 'payu_response')
  final String payuResponse;
  final String accountNumber;
  @JsonKey(name: 'ant_txn_id')
  final String antTxnId;
  final String clientTxnId;
  final String customerId;
  final int fee;
  final String fundFlowType;
  final String implId;
  final String implType;
  final String loadCurrency;
  final String messageCode;
  final String mobile;
  final String originalClientTxnId;
  @JsonKey(name: 'payment_method')
  final String paymentMethod;
  final String pgNo;
  final String refundFileId;
  final String remark;
  final String requestDateTime;
  final String sender;
  final String sourceAccount;
  final int sourceType;
  @JsonKey(name: 'tag_name')
  final String tagName;
  final int transactionAmount;
  final int transactionResult;
  @JsonKey(name: 'transaction_type')
  final String transactionType;


  CustomerLoadbalanceRequest({
    required this.accountNumber,
    required this.antTxnId,
    required this.clientTxnId,
    required this.customerId,
    required this.fee,
    required this.fundFlowType,
    required this.implId,
    required this.implType,
    required this.loadCurrency,
    required this.messageCode,
    required this.mobile,
    required this.originalClientTxnId,
    required this.paymentMethod,
    required this.payuResponse,
    required this.pgNo,
    required this.refundFileId,
    required this.remark,
    required this.requestDateTime,
    required this.sender,
    required this.sourceAccount,
    required this.sourceType,
    required this.tagName,
    required this.transactionAmount,
    required this.transactionResult,
    required this.transactionType,
    required this.aParam,
  });

  factory CustomerLoadbalanceRequest.fromJson(Map<String, dynamic> json) =>
      _$CustomerLoadbalanceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerLoadbalanceRequestToJson(this);
}
