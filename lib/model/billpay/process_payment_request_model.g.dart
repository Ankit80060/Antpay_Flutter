// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'process_payment_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProcessPaymentRequestModel _$ProcessPaymentRequestModelFromJson(
        Map<String, dynamic> json) =>
    ProcessPaymentRequestModel(
      actionName: json['action_name'] as String?,
      transactionType: json['transaction_type'] as String?,
      p1: json['p1'] as String?,
      p2: json['p2'] as String?,
      p3: json['p3'] as String?,
      p4: json['p4'] as String?,
      p5: json['p5'] as String?,
      p6: json['p6'] as String?,
      p7: json['p7'] as String?,
      p8: json['p8'] as String?,
      paymentMethod: json['payment_method'] as String?,
      razorPaySignature: json['razorpay_signature'] as String?,
      razorPayPaymentID: json['razorpay_payment_id'] as String?,
      razorPayOrderID: json['razorpay_order_id'] as String?,
      orderNumber: json['orderNo'] as String?,
      statusCode: json['statusCode'] as String?,
      statusDesc: json['statusDesc'] as String?,
      amount: json['amount'] as String?,
      cardID: json['card_id'] as String?,
      description: json['description'] as String?,
      antTrxId: json['ant_txn_id'] as String?,
      transactionReferenceNumber:
          json['transaction_reference_number'] as String?,
      yesBankReferenceNumber: json['yes_bank_reference_number'] as String?,
      payuResponse: json['payu_response'] as String?,
      scratchCardCode: json['scratch_card_code'] as String?,
      rentPayId: json['rent_pay_id'] as String?,
      accosaRefNo: json['accosaRefNo'] as String?,
      accosaTransactionId: (json['accosaTransactionId'] as num?)?.toInt(),
      clientTxnId: json['clientTxnId'] as String?,
      responseCode: json['responseCode'] as String?,
      responseDateTime: json['responseDateTime'] as String?,
      responseMessage: json['responseMessage'] as String?,
      transactionResult: (json['transactionResult'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProcessPaymentRequestModelToJson(
        ProcessPaymentRequestModel instance) =>
    <String, dynamic>{
      'action_name': instance.actionName,
      'transaction_type': instance.transactionType,
      'p1': instance.p1,
      'p2': instance.p2,
      'p3': instance.p3,
      'p4': instance.p4,
      'p5': instance.p5,
      'p6': instance.p6,
      'p7': instance.p7,
      'p8': instance.p8,
      'payment_method': instance.paymentMethod,
      'razorpay_signature': instance.razorPaySignature,
      'razorpay_payment_id': instance.razorPayPaymentID,
      'razorpay_order_id': instance.razorPayOrderID,
      'orderNo': instance.orderNumber,
      'statusCode': instance.statusCode,
      'statusDesc': instance.statusDesc,
      'amount': instance.amount,
      'card_id': instance.cardID,
      'description': instance.description,
      'ant_txn_id': instance.antTrxId,
      'transaction_reference_number': instance.transactionReferenceNumber,
      'yes_bank_reference_number': instance.yesBankReferenceNumber,
      'payu_response': instance.payuResponse,
      'scratch_card_code': instance.scratchCardCode,
      'rent_pay_id': instance.rentPayId,
      'accosaRefNo': instance.accosaRefNo,
      'accosaTransactionId': instance.accosaTransactionId,
      'clientTxnId': instance.clientTxnId,
      'responseCode': instance.responseCode,
      'responseDateTime': instance.responseDateTime,
      'responseMessage': instance.responseMessage,
      'transactionResult': instance.transactionResult,
    };
