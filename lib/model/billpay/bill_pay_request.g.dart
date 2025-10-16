// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_pay_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillPayRequest _$BillPayRequestFromJson(Map<String, dynamic> json) =>
    BillPayRequest(
      antTxnId: json['ant_txn_id'] as String?,
      billerCategory: json['biller_category'] as String?,
      billerId: json['billerId'] as String?,
      mobile: json['mobile'] as String?,
      amount: json['amount'] as String?,
      requestId: json['requestId'] as String?,
      inputparameter: json['inputparameter'] as Map<String, dynamic>?,
      billResult: json['bill_result'] as Map<String, dynamic>?,
      payuResponse: json['payu_response'] as String?,
      aParam: json['aParam'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$BillPayRequestToJson(BillPayRequest instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'ant_txn_id': instance.antTxnId,
      'bill_result': instance.billResult,
      'biller_category': instance.billerCategory,
      'billerId': instance.billerId,
      'inputparameter': instance.inputparameter,
      'mobile': instance.mobile,
      'requestId': instance.requestId,
      'payu_response': instance.payuResponse,
      'aParam': instance.aParam,
      'email': instance.email,
    };

BillResult _$BillResultFromJson(Map<String, dynamic> json) => BillResult(
      responseCode: json['responseCode'] as String?,
      inputParams: json['inputParams'] == null
          ? null
          : InputParams.fromJson(json['inputParams'] as Map<String, dynamic>),
      billerResponse: json['billerResponse'] == null
          ? null
          : BillerResponse.fromJson(
              json['billerResponse'] as Map<String, dynamic>),
      additionalInfo: json['additionalInfo'] == null
          ? null
          : AdditionalInfo.fromJson(
              json['additionalInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BillResultToJson(BillResult instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'inputParams': instance.inputParams,
      'billerResponse': instance.billerResponse,
      'additionalInfo': instance.additionalInfo,
    };

BillPayResult _$BillPayResultFromJson(Map<String, dynamic> json) =>
    BillPayResult(
      responseCode: json['responseCode'] as String?,
      responseReason: json['responseReason'] as String?,
      txnRefId: json['txnRefId'] as String?,
      approvalRefNumber: json['approvalRefNumber'] as String?,
      txnRespType: json['txnRespType'] as String?,
      custConvFee: json['CustConvFee'] as String?,
      respAmount: json['RespAmount'] as String?,
      respBillNumber: json['RespBillNumber'] as String?,
      respCustomerName: json['RespCustomerName'] as String?,
      inputParams: json['inputParams'] == null
          ? null
          : InputParams.fromJson(json['inputParams'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BillPayResultToJson(BillPayResult instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'responseReason': instance.responseReason,
      'txnRefId': instance.txnRefId,
      'approvalRefNumber': instance.approvalRefNumber,
      'txnRespType': instance.txnRespType,
      'CustConvFee': instance.custConvFee,
      'RespAmount': instance.respAmount,
      'RespBillNumber': instance.respBillNumber,
      'RespCustomerName': instance.respCustomerName,
      'inputParams': instance.inputParams,
    };

InputParams _$InputParamsFromJson(Map<String, dynamic> json) => InputParams(
      param1: json['input'],
    );

Map<String, dynamic> _$InputParamsToJson(InputParams instance) =>
    <String, dynamic>{
      'input': instance.param1,
    };

BillerResponse _$BillerResponseFromJson(Map<String, dynamic> json) =>
    BillerResponse(
      billAmount: (json['billAmount'] as num?)?.toDouble(),
      billDate: json['billDate'] as String?,
      billNumber: json['billNumber'] as String?,
      billPeriod: json['billPeriod'] as String?,
      customerName: json['customerName'] as String?,
      dueDate: json['dueDate'] as String?,
    );

Map<String, dynamic> _$BillerResponseToJson(BillerResponse instance) =>
    <String, dynamic>{
      'billAmount': instance.billAmount,
      'billDate': instance.billDate,
      'billNumber': instance.billNumber,
      'billPeriod': instance.billPeriod,
      'customerName': instance.customerName,
      'dueDate': instance.dueDate,
    };

AdditionalInfo _$AdditionalInfoFromJson(Map<String, dynamic> json) =>
    AdditionalInfo(
      info: json['info'],
    );

Map<String, dynamic> _$AdditionalInfoToJson(AdditionalInfo instance) =>
    <String, dynamic>{
      'info': instance.info,
    };

BillPayResponse _$BillPayResponseFromJson(Map<String, dynamic> json) =>
    BillPayResponse(
      status: (json['status'] as num?)?.toInt(),
      response: json['response'] == null
          ? null
          : BillPayResult.fromJson(json['response'] as Map<String, dynamic>),
      errorMsg: json['error_msg'] as String?,
    );

Map<String, dynamic> _$BillPayResponseToJson(BillPayResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'response': instance.response,
      'error_msg': instance.errorMsg,
    };
