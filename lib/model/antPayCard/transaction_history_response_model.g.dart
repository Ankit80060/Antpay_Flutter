// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_history_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerTransactionHistoryRequestModel
    _$CustomerTransactionHistoryRequestModelFromJson(
            Map<String, dynamic> json) =>
        CustomerTransactionHistoryRequestModel(
          aParam: json['aParam'] as String?,
          messageCode: json['messageCode'] as String?,
          requestDateTime: json['requestDateTime'] as String?,
          clientTxnId: json['clientTxnId'] as String?,
          fromDate: json['fromDate'] as String?,
          toDate: json['toDate'] as String?,
          last4Digits: json['last4Digits'] as String?,
          urn: json['urn'] as String?,
          customerId: json['customerId'] as String?,
          pageNumber: json['pageNumber'] as String?,
          count: json['count'] as String?,
          fromRowId: json['fromRowId'] as String?,
        );

Map<String, dynamic> _$CustomerTransactionHistoryRequestModelToJson(
        CustomerTransactionHistoryRequestModel instance) =>
    <String, dynamic>{
      'messageCode': instance.messageCode,
      'aParam': instance.aParam,
      'requestDateTime': instance.requestDateTime,
      'clientTxnId': instance.clientTxnId,
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
      'last4Digits': instance.last4Digits,
      'urn': instance.urn,
      'customerId': instance.customerId,
      'pageNumber': instance.pageNumber,
      'count': instance.count,
      'fromRowId': instance.fromRowId,
    };

CustomerTransactionHistoryResponseModel
    _$CustomerTransactionHistoryResponseModelFromJson(
            Map<String, dynamic> json) =>
        CustomerTransactionHistoryResponseModel(
          urn: (json['urn'] as num?)?.toInt(),
          customerId: json['customerId'] as String?,
          responseCode: json['responseCode'] as String?,
          messageCode: (json['messageCode'] as num?)?.toInt(),
          clientTxnId: json['clientTxnId'] as String?,
          clientId: json['clientId'] as String?,
          responseDateTime: json['responseDateTime'] as String?,
          responseMessage: json['responseMessage'] as String?,
          bankId: (json['bankId'] as num?)?.toInt(),
          availableBalance: json['availableBalance'] as String?,
          availableCashLimit: json['availableCashLimit'] as String?,
          pageNumber: (json['pageNumber'] as num?)?.toInt(),
          count: (json['count'] as num?)?.toInt(),
          openingBalance: json['openingBalance'] as String?,
          closingBalance: json['closingBalance'] as String?,
          statementDetails: (json['statementDetails'] as List<dynamic>?)
              ?.map((e) => StatementDetails.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$CustomerTransactionHistoryResponseModelToJson(
        CustomerTransactionHistoryResponseModel instance) =>
    <String, dynamic>{
      'urn': instance.urn,
      'customerId': instance.customerId,
      'responseCode': instance.responseCode,
      'messageCode': instance.messageCode,
      'clientTxnId': instance.clientTxnId,
      'clientId': instance.clientId,
      'responseDateTime': instance.responseDateTime,
      'responseMessage': instance.responseMessage,
      'bankId': instance.bankId,
      'availableBalance': instance.availableBalance,
      'availableCashLimit': instance.availableCashLimit,
      'pageNumber': instance.pageNumber,
      'count': instance.count,
      'openingBalance': instance.openingBalance,
      'closingBalance': instance.closingBalance,
      'statementDetails': instance.statementDetails,
    };

StatementDetails _$StatementDetailsFromJson(Map<String, dynamic> json) =>
    StatementDetails(
      merchantName: json['merchantName'] as String?,
      transactionType: json['transactionType'] as String?,
      transactionAmount: json['transactionAmount'] as String?,
      transactionDate: json['transactionDate'] as String?,
      merchantCity: json['merchantCity'] as String?,
      transRefNumber: json['transRefNumber'] as String?,
      reserved1: json['reserved1'] as String?,
      reserved2: json['reserved2'] as String?,
      reserved4: json['reserved4'] as String?,
      eventId: (json['eventId'] as num?)?.toInt(),
      rowId: (json['rowId'] as num?)?.toInt(),
      authEpfTxnId: json['authEpfTxnId'] as String?,
      rrn: json['rrn'] as String?,
      stan: json['stan'] as String?,
      approvalCode: json['approvalCode'] as String?,
      isMerchantTxn: (json['isMerchantTxn'] as num?)?.toInt(),
      clientTxnId: json['clientTxnId'] as String?,
      status: json['status'] as String?,
      closingBalance: (json['closingBalance'] as num?)?.toInt(),
      openingBalance: (json['openningBalance'] as num?)?.toInt(),
      transactionNarration: json['transactionNarration'] as String?,
      mcc: (json['mcc'] as num?)?.toInt(),
    );

Map<String, dynamic> _$StatementDetailsToJson(StatementDetails instance) =>
    <String, dynamic>{
      'merchantName': instance.merchantName,
      'transactionType': instance.transactionType,
      'transactionAmount': instance.transactionAmount,
      'transactionDate': instance.transactionDate,
      'merchantCity': instance.merchantCity,
      'transRefNumber': instance.transRefNumber,
      'reserved1': instance.reserved1,
      'reserved2': instance.reserved2,
      'reserved4': instance.reserved4,
      'eventId': instance.eventId,
      'rowId': instance.rowId,
      'authEpfTxnId': instance.authEpfTxnId,
      'rrn': instance.rrn,
      'stan': instance.stan,
      'approvalCode': instance.approvalCode,
      'isMerchantTxn': instance.isMerchantTxn,
      'clientTxnId': instance.clientTxnId,
      'status': instance.status,
      'closingBalance': instance.closingBalance,
      'openningBalance': instance.openingBalance,
      'transactionNarration': instance.transactionNarration,
      'mcc': instance.mcc,
    };
