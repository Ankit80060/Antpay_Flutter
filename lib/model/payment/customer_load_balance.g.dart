// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_load_balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerLoadbalanceRequest _$CustomerLoadbalanceRequestFromJson(
        Map<String, dynamic> json) =>
    CustomerLoadbalanceRequest(
      messageCode: json['messageCode'] as String?,
      clientTxnId: json['clientTxnId'] as String?,
      requestDateTime: json['requestDateTime'] as String?,
      customerId: json['customerId'] as String?,
      accountNumber: json['accountNumber'] as String?,
      transactionAmount: (json['transactionAmount'] as num?)?.toInt(),
      sender: json['sender'] as String?,
      loadCurrency: json['loadCurrency'] as String?,
      sourceType: (json['sourceType'] as num?)?.toInt(),
      sourceAccount: json['sourceAccount'] as String?,
      originalClientTxnId: json['originalClientTxnId'] as String?,
      fundFlowType: json['fundFlowType'] as String?,
      implId: json['implId'] as String?,
      implType: json['implType'] as String?,
      refundFileId: json['refundFileId'] as String?,
      fee: (json['fee'] as num?)?.toInt(),
      antTxnId: json['ant_txn_id'] as String?,
      tagName: json['tag_name'] as String?,
      mobile: json['mobile'] as String?,
      remark: json['remark'] as String?,
      paymentMethod: json['payment_method'] as String?,
      payuResponse: json['payu_response'] as String?,
      transactionResult: (json['transactionResult'] as num?)?.toInt(),
      transactionType: json['transaction_type'] as String?,
      pgNo: json['pgNo'] as String?,
      aParam: json['aParam'] as String?,
    );

Map<String, dynamic> _$CustomerLoadbalanceRequestToJson(
        CustomerLoadbalanceRequest instance) =>
    <String, dynamic>{
      'aParam': instance.aParam,
      'payu_response': instance.payuResponse,
      'messageCode': instance.messageCode,
      'clientTxnId': instance.clientTxnId,
      'requestDateTime': instance.requestDateTime,
      'customerId': instance.customerId,
      'accountNumber': instance.accountNumber,
      'transactionAmount': instance.transactionAmount,
      'sender': instance.sender,
      'loadCurrency': instance.loadCurrency,
      'sourceType': instance.sourceType,
      'sourceAccount': instance.sourceAccount,
      'originalClientTxnId': instance.originalClientTxnId,
      'fundFlowType': instance.fundFlowType,
      'implId': instance.implId,
      'implType': instance.implType,
      'refundFileId': instance.refundFileId,
      'fee': instance.fee,
      'ant_txn_id': instance.antTxnId,
      'tag_name': instance.tagName,
      'mobile': instance.mobile,
      'remark': instance.remark,
      'payment_method': instance.paymentMethod,
      'transactionResult': instance.transactionResult,
      'transaction_type': instance.transactionType,
      'pgNo': instance.pgNo,
    };

CustomerLoadbalanceResponse _$CustomerLoadbalanceResponseFromJson(
        Map<String, dynamic> json) =>
    CustomerLoadbalanceResponse(
      urn: (json['urn'] as num?)?.toInt(),
      customerId: json['customerId'] as String?,
      responseCode: json['responseCode'] as String?,
      messageCode: (json['messageCode'] as num?)?.toInt(),
      clientTxnId: json['clientTxnId'] as String?,
      responseDateTime: json['responseDateTime'] as String?,
      accosaTransactionId: (json['accosaTransactionId'] as num?)?.toInt(),
      responseMessage: json['responseMessage'] as String?,
      accosaRefNo: json['accosaRefNo'] as String?,
      availableBalance: (json['availableBalance'] as num?)?.toInt(),
      availableCashLimit: (json['availableCashLimit'] as num?)?.toInt(),
      transactionAmount: (json['transactionAmount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CustomerLoadbalanceResponseToJson(
        CustomerLoadbalanceResponse instance) =>
    <String, dynamic>{
      'urn': instance.urn,
      'customerId': instance.customerId,
      'responseCode': instance.responseCode,
      'messageCode': instance.messageCode,
      'clientTxnId': instance.clientTxnId,
      'responseDateTime': instance.responseDateTime,
      'accosaTransactionId': instance.accosaTransactionId,
      'responseMessage': instance.responseMessage,
      'accosaRefNo': instance.accosaRefNo,
      'availableBalance': instance.availableBalance,
      'availableCashLimit': instance.availableCashLimit,
      'transactionAmount': instance.transactionAmount,
    };
