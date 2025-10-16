// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_complain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostComplain _$PostComplainFromJson(Map<String, dynamic> json) => PostComplain(
      type: json['type'] as String?,
      aParam: json['aParam'] as String?,
      msg: json['msg'] as String?,
      utransid: json['utransid'] as String?,
      status: (json['status'] as num?)?.toInt(),
      complainId: json['complain_id'] as String?,
      transactionID: json['TransactionID'] as String?,
      utransactionID: json['UtransactionID'] as bool?,
      operatorID: json['OperatorID'] as String?,
      number: json['Number'] as String?,
      amount: json['Amount'] as String?,
      complaintStatus: json['Status'] as String?,
      responseMessage: json['ResposneMessage'] as String?,
      marginPercentage: json['MarginPercentage'] as String?,
      marginAmount: json['MarginAmount'] as String?,
      errorCode: (json['ErrorCode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PostComplainToJson(PostComplain instance) =>
    <String, dynamic>{
      'type': instance.type,
      'aParam': instance.aParam,
      'msg': instance.msg,
      'utransid': instance.utransid,
      'status': instance.status,
      'complain_id': instance.complainId,
      'TransactionID': instance.transactionID,
      'UtransactionID': instance.utransactionID,
      'OperatorID': instance.operatorID,
      'Number': instance.number,
      'Amount': instance.amount,
      'Status': instance.complaintStatus,
      'ResposneMessage': instance.responseMessage,
      'MarginPercentage': instance.marginPercentage,
      'MarginAmount': instance.marginAmount,
      'ErrorCode': instance.errorCode,
    };
