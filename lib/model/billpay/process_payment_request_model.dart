import 'package:json_annotation/json_annotation.dart';

part 'process_payment_request_model.g.dart';

@JsonSerializable()
class ProcessPaymentRequestModel {
  @JsonKey(name: 'action_name')
   String? actionName;

  @JsonKey(name: 'transaction_type')
   String? transactionType;

   String? p1;
   String? p2;
   String? p3;
   String? p4;
   String? p5;
   String? p6;
   String? p7;
   String? p8;

  @JsonKey(name: 'payment_method')
   String? paymentMethod;

  @JsonKey(name: 'razorpay_signature')
   String? razorPaySignature;

  @JsonKey(name: 'razorpay_payment_id')
   String? razorPayPaymentID;

  @JsonKey(name: 'razorpay_order_id')
   String? razorPayOrderID;

  @JsonKey(name: 'orderNo')
   String? orderNumber;

   String? statusCode;
   String? statusDesc;
   String? amount;

  @JsonKey(name: 'card_id')
  String? cardID;

  String? description;

  @JsonKey(name: 'ant_txn_id')
  String? antTrxId;

  @JsonKey(name: 'transaction_reference_number')
  String? transactionReferenceNumber;

  @JsonKey(name: 'yes_bank_reference_number')
  String? yesBankReferenceNumber;

  @JsonKey(name: 'payu_response')
  String? payuResponse;

  @JsonKey(name: 'scratch_card_code')
  String? scratchCardCode;

  @JsonKey(name: 'rent_pay_id')
  String? rentPayId;

  @JsonKey(name: 'accosaRefNo')
  String? accosaRefNo;

  @JsonKey(name: 'accosaTransactionId')
  int? accosaTransactionId;

  @JsonKey(name: 'clientTxnId')
  String? clientTxnId;

  String? responseCode;
  String? responseDateTime;
  String? responseMessage;

  int? transactionResult;

  ProcessPaymentRequestModel({
    this.actionName,
    this.transactionType,
    this.p1,
    this.p2,
    this.p3,
    this.p4,
    this.p5,
    this.p6,
    this.p7,
    this.p8,
    this.paymentMethod,
    this.razorPaySignature,
    this.razorPayPaymentID,
    this.razorPayOrderID,
    this.orderNumber,
    this.statusCode,
    this.statusDesc,
    this.amount,
    this.cardID,
    this.description,
    this.antTrxId,
    this.transactionReferenceNumber,
    this.yesBankReferenceNumber,
    this.payuResponse,
    this.scratchCardCode,
    this.rentPayId,
    this.accosaRefNo,
    this.accosaTransactionId,
    this.clientTxnId,
    this.responseCode,
    this.responseDateTime,
    this.responseMessage,
    this.transactionResult,
  });

  factory ProcessPaymentRequestModel.fromJson(Map<String, dynamic> json) => _$ProcessPaymentRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProcessPaymentRequestModelToJson(this);

  @override
  String toString() => 'ProcessPaymentRequestModel(actionName: \$actionName, transactionType: \$transactionType, p1: \$p1, p2: \$p2, p3: \$p3, p4: \$p4, p5: \$p5, p6: \$p6, p7: \$p7, p8: \$p8, paymentMethod: \$paymentMethod, razorPaySignature: \$razorPaySignature, razorPayPaymentID: \$razorPayPaymentID, razorPayOrderID: \$razorPayOrderID, orderNumber: \$orderNumber, statusCode: \$statusCode, statusDesc: \$statusDesc, amount: \$amount, cardID: \$cardID, description: \$description, antTrxId: \$antTrxId, transactionReferenceNumber: \$transactionReferenceNumber, yesBankReferenceNumber: \$yesBankReferenceNumber, payuResponse: \$payuResponse, scratchCardCode: \$scratchCardCode, rentPayId: \$rentPayId, accosaRefNo: \$accosaRefNo, accosaTransactionId: \$accosaTransactionId, clientTxnId: \$clientTxnId, responseCode: \$responseCode, responseDateTime: \$responseDateTime, responseMessage: \$responseMessage, transactionResult: \$transactionResult)';
}
