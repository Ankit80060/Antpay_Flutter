// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recharge_payu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RechargePayUPaymentReq _$RechargePayUPaymentReqFromJson(
        Map<String, dynamic> json) =>
    RechargePayUPaymentReq(
      servicetype: json['service_type'] as String?,
      antTxnId: json['ant_txn_id'] as String?,
      aParam: json['aParam'] as String?,
      circlecode: json['circlecode'] as String?,
      operatorcode: json['operatorcode'] as String?,
      amount: json['amount'] as String?,
      number: json['number'] as String?,
      customermobile: json['customermobile'] as String?,
      paymentMethod: json['payment_method'] as String?,
      payuResponse: json['payu_response'] as String?,
      transactionResult: (json['transactionResult'] as num?)?.toInt(),
      transactionType: json['transaction_type'] as String?,
    );

Map<String, dynamic> _$RechargePayUPaymentReqToJson(
        RechargePayUPaymentReq instance) =>
    <String, dynamic>{
      'ant_txn_id': instance.antTxnId,
      'circlecode': instance.circlecode,
      'operatorcode': instance.operatorcode,
      'amount': instance.amount,
      'aParam': instance.aParam,
      'number': instance.number,
      'customermobile': instance.customermobile,
      'payment_method': instance.paymentMethod,
      'payu_response': instance.payuResponse,
      'transactionResult': instance.transactionResult,
      'transaction_type': instance.transactionType,
      'service_type': instance.servicetype,
    };

RechargePayUPaymentRes _$RechargePayUPaymentResFromJson(
        Map<String, dynamic> json) =>
    RechargePayUPaymentRes(
      complain_id: json['complain_id'] as String?,
      transactionID: json['TransactionID'] as String?,
      utransactionID: json['UtransactionID'] as String?,
      operatorID: json['OperatorID'] as String?,
      number: json['Number'] as String?,
      amount: json['Amount'] as String?,
      status: const StringOrIntToIntConverter().fromJson(json['Status']),
      responseMessage: json['ResposneMessage'] as String?,
      marginPercentage: json['MarginPercentage'] as String?,
      marginAmount: json['MarginAmount'] as String?,
    );

Map<String, dynamic> _$RechargePayUPaymentResToJson(
        RechargePayUPaymentRes instance) =>
    <String, dynamic>{
      'TransactionID': instance.transactionID,
      'UtransactionID': instance.utransactionID,
      'OperatorID': instance.operatorID,
      'Number': instance.number,
      'Amount': instance.amount,
      'Status': const StringOrIntToIntConverter().toJson(instance.status),
      'ResposneMessage': instance.responseMessage,
      'MarginPercentage': instance.marginPercentage,
      'MarginAmount': instance.marginAmount,
      'complain_id': instance.complain_id,
    };
