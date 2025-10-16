// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FetchBillBean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchBillRequestModel _$FetchBillRequestModelFromJson(
        Map<String, dynamic> json) =>
    FetchBillRequestModel(
      number: json['number'] as String?,
      Operator_Code: json['Operator_Code'] as String?,
    )..aParam = json['aParam'] as String?;

Map<String, dynamic> _$FetchBillRequestModelToJson(
        FetchBillRequestModel instance) =>
    <String, dynamic>{
      'number': instance.number,
      'aParam': instance.aParam,
      'Operator_Code': instance.Operator_Code,
    };

FetchBillBean _$FetchBillBeanFromJson(Map<String, dynamic> json) =>
    FetchBillBean(
      amount: json['amount'] as String?,
      addinfo: const _AddInfoConverter().fromJson(json['addinfo']),
      errormsg: json['errormsg'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$FetchBillBeanToJson(FetchBillBean instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'addinfo': const _AddInfoConverter().toJson(instance.addinfo),
      'errormsg': instance.errormsg,
      'status': instance.status,
    };

AddInfo _$AddInfoFromJson(Map<String, dynamic> json) => AddInfo(
      bill_number: json['bill_number'] as String?,
      due_date: json['due_date'] as String?,
      bill_date: json['bill_date'] as String?,
      bill_amount: json['bill_amount'] as String?,
      bill_customer: json['bill_customer'] as String?,
      bill_partial: json['bill_partial'] as String?,
    );

Map<String, dynamic> _$AddInfoToJson(AddInfo instance) => <String, dynamic>{
      'bill_number': instance.bill_number,
      'due_date': instance.due_date,
      'bill_date': instance.bill_date,
      'bill_amount': instance.bill_amount,
      'bill_customer': instance.bill_customer,
      'bill_partial': instance.bill_partial,
    };
