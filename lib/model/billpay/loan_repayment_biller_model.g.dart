// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_repayment_biller_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchBillerModel _$FetchBillerModelFromJson(Map<String, dynamic> json) =>
    FetchBillerModel(
      mobile: json['mobile'] as String?,
      biller_category: json['biller_category'] as String?,
      billerId: json['billerId'] as String?,
      inputparameter: json['inputparameter'] as Map<String, dynamic>?,
      aParam: json['aParam'] as String?,
    );

Map<String, dynamic> _$FetchBillerModelToJson(FetchBillerModel instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'aParam': instance.aParam,
      'biller_category': instance.biller_category,
      'billerId': instance.billerId,
      'inputparameter': instance.inputparameter,
    };

LoanRepaymentBillerModel _$LoanRepaymentBillerModelFromJson(
        Map<String, dynamic> json) =>
    LoanRepaymentBillerModel(
      status: (json['status'] as num?)?.toInt(),
      msg: json['msg'] as String?,
      billResult: json['bill_result'] == null
          ? null
          : LoanRepaymentBillResult.fromJson(
              json['bill_result'] as Map<String, dynamic>),
      order_id: json['order_id'] as String?,
      requestId: json['requestId'] as String?,
    );

Map<String, dynamic> _$LoanRepaymentBillerModelToJson(
        LoanRepaymentBillerModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'bill_result': instance.billResult,
      'msg': instance.msg,
      'order_id': instance.order_id,
      'requestId': instance.requestId,
    };

LoanRepaymentBillResult _$LoanRepaymentBillResultFromJson(
        Map<String, dynamic> json) =>
    LoanRepaymentBillResult(
      responseCode: json['responseCode'] as String?,
      inputParams: json['inputParams'] as Map<String, dynamic>?,
      billerResponse: json['billerResponse'] == null
          ? null
          : LoanBillerResponse.fromJson(
              json['billerResponse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoanRepaymentBillResultToJson(
        LoanRepaymentBillResult instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'inputParams': instance.inputParams,
      'billerResponse': instance.billerResponse,
    };

LoanBillerResponse _$LoanBillerResponseFromJson(Map<String, dynamic> json) =>
    LoanBillerResponse(
      billAmount: (json['billAmount'] as num?)?.toDouble() ?? 0,
      billDate: json['billDate'] as String?,
      billNumber: json['billNumber'] as String?,
      billPeriod: json['billPeriod'] as String?,
      customerName: json['customerName'] as String?,
      dueDate: json['dueDate'] as String?,
      customerconveniencefees:
          (json['customerconveniencefees'] as num?)?.toDouble() ?? 0,
      total_amount_to_pay:
          (json['total_amount_to_pay'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$LoanBillerResponseToJson(LoanBillerResponse instance) =>
    <String, dynamic>{
      'billAmount': instance.billAmount,
      'billDate': instance.billDate,
      'billNumber': instance.billNumber,
      'billPeriod': instance.billPeriod,
      'customerName': instance.customerName,
      'dueDate': instance.dueDate,
      'customerconveniencefees': instance.customerconveniencefees,
      'total_amount_to_pay': instance.total_amount_to_pay,
    };
