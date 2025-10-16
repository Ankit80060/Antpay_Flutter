// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CustomerLoadbalanceRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerLoadbalanceRequest _$CustomerLoadbalanceRequestFromJson(
        Map<String, dynamic> json) =>
    CustomerLoadbalanceRequest(
      accountNumber: json['accountNumber'] as String,
      antTxnId: json['ant_txn_id'] as String,
      clientTxnId: json['clientTxnId'] as String,
      customerId: json['customerId'] as String,
      fee: (json['fee'] as num).toInt(),
      fundFlowType: json['fundFlowType'] as String,
      implId: json['implId'] as String,
      implType: json['implType'] as String,
      loadCurrency: json['loadCurrency'] as String,
      messageCode: json['messageCode'] as String,
      mobile: json['mobile'] as String,
      originalClientTxnId: json['originalClientTxnId'] as String,
      paymentMethod: json['payment_method'] as String,
      payuResponse: json['payu_response'] as String,
      pgNo: json['pgNo'] as String,
      refundFileId: json['refundFileId'] as String,
      remark: json['remark'] as String,
      requestDateTime: json['requestDateTime'] as String,
      sender: json['sender'] as String,
      sourceAccount: json['sourceAccount'] as String,
      sourceType: (json['sourceType'] as num).toInt(),
      tagName: json['tag_name'] as String,
      transactionAmount: (json['transactionAmount'] as num).toInt(),
      transactionResult: (json['transactionResult'] as num).toInt(),
      transactionType: json['transaction_type'] as String,
      aParam: json['aParam'] as String,
    );

Map<String, dynamic> _$CustomerLoadbalanceRequestToJson(
        CustomerLoadbalanceRequest instance) =>
    <String, dynamic>{
      'aParam': instance.aParam,
      'payu_response': instance.payuResponse,
      'accountNumber': instance.accountNumber,
      'ant_txn_id': instance.antTxnId,
      'clientTxnId': instance.clientTxnId,
      'customerId': instance.customerId,
      'fee': instance.fee,
      'fundFlowType': instance.fundFlowType,
      'implId': instance.implId,
      'implType': instance.implType,
      'loadCurrency': instance.loadCurrency,
      'messageCode': instance.messageCode,
      'mobile': instance.mobile,
      'originalClientTxnId': instance.originalClientTxnId,
      'payment_method': instance.paymentMethod,
      'pgNo': instance.pgNo,
      'refundFileId': instance.refundFileId,
      'remark': instance.remark,
      'requestDateTime': instance.requestDateTime,
      'sender': instance.sender,
      'sourceAccount': instance.sourceAccount,
      'sourceType': instance.sourceType,
      'tag_name': instance.tagName,
      'transactionAmount': instance.transactionAmount,
      'transactionResult': instance.transactionResult,
      'transaction_type': instance.transactionType,
    };
