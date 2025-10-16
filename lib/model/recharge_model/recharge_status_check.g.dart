// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recharge_status_check.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RechargeStatusRes _$RechargeStatusResFromJson(Map<String, dynamic> json) =>
    RechargeStatusRes(
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

Map<String, dynamic> _$RechargeStatusResToJson(RechargeStatusRes instance) =>
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

RechargeStatusReq _$RechargeStatusReqFromJson(Map<String, dynamic> json) =>
    RechargeStatusReq(
      aParam: json['aParam'] as String?,
      utransactionid: json['utransactionid'] as String?,
    );

Map<String, dynamic> _$RechargeStatusReqToJson(RechargeStatusReq instance) =>
    <String, dynamic>{
      'aParam': instance.aParam,
      'utransactionid': instance.utransactionid,
    };
