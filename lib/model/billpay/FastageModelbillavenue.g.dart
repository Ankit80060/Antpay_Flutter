// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FastageModelbillavenue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FastageModelbillavenueModel _$FastageModelbillavenueModelFromJson(
        Map<String, dynamic> json) =>
    FastageModelbillavenueModel(
      mobile: json['mobile'] as String?,
      biller_category: json['biller_category'] as String?,
      billerId: json['billerId'] as String?,
      inputparameter: json['inputparameter'],
    );

Map<String, dynamic> _$FastageModelbillavenueModelToJson(
        FastageModelbillavenueModel instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'biller_category': instance.biller_category,
      'billerId': instance.billerId,
      'inputparameter': instance.inputparameter,
    };

FetchBillBeanFastage _$FetchBillBeanFastageFromJson(
        Map<String, dynamic> json) =>
    FetchBillBeanFastage(
      status: (json['status'] as num?)?.toInt(),
      msg: json['msg'] as String?,
      orderId: json['order_id'] as String?,
      requestId: json['requestId'] as String?,
      billResult: json['bill_result'] == null
          ? null
          : BillResult.fromJson(json['bill_result'] as Map<String, dynamic>),
      customerconveniencefees:
          (json['customerconveniencefees'] as num?)?.toInt(),
      totalAmountToPay: (json['total_amount_to_pay'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FetchBillBeanFastageToJson(
        FetchBillBeanFastage instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'order_id': instance.orderId,
      'requestId': instance.requestId,
      'bill_result': instance.billResult,
      'customerconveniencefees': instance.customerconveniencefees,
      'total_amount_to_pay': instance.totalAmountToPay,
    };

BillResult _$BillResultFromJson(Map<String, dynamic> json) => BillResult(
      responseCode: json['responseCode'] as String?,
      inputParams: json['inputParams'],
      billerResponse: json['billerResponse'] == null
          ? null
          : GetBillerResponse.fromJson(
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

InputParams _$InputParamsFromJson(Map<String, dynamic> json) => InputParams(
      input: (json['input'] as List<dynamic>)
          .map((e) =>
              e == null ? null : Input.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InputParamsToJson(InputParams instance) =>
    <String, dynamic>{
      'input': instance.input,
    };

Input _$InputFromJson(Map<String, dynamic> json) => Input(
      paramName: json['paramName'] as String?,
      paramValue: json['paramValue'] as String?,
    );

Map<String, dynamic> _$InputToJson(Input instance) => <String, dynamic>{
      'paramName': instance.paramName,
      'paramValue': instance.paramValue,
    };

GetBillerResponse _$GetBillerResponseFromJson(Map<String, dynamic> json) =>
    GetBillerResponse(
      billPeriod: json['billPeriod'] as String?,
      billAmount: json['billAmount'],
      billNumber: json['billNumber'] as String?,
      customerName: json['customerName'] as String?,
      billDate: json['billDate'] as String?,
      dueDate: json['dueDate'] as String?,
    );

Map<String, dynamic> _$GetBillerResponseToJson(GetBillerResponse instance) =>
    <String, dynamic>{
      'billAmount': instance.billAmount,
      'billNumber': instance.billNumber,
      'customerName': instance.customerName,
      'billDate': instance.billDate,
      'dueDate': instance.dueDate,
      'billPeriod': instance.billPeriod,
    };

AdditionalInfo _$AdditionalInfoFromJson(Map<String, dynamic> json) =>
    AdditionalInfo(
      info: (json['info'] as List<dynamic>?)
          ?.map((e) => Info.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AdditionalInfoToJson(AdditionalInfo instance) =>
    <String, dynamic>{
      'info': instance.info,
    };

Info _$InfoFromJson(Map<String, dynamic> json) => Info(
      infoName: json['infoName'] as String?,
      infoValue: json['infoValue'] as String?,
    );

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'infoName': instance.infoName,
      'infoValue': instance.infoValue,
    };
