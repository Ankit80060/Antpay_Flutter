// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'convenience_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConvenienceReqData _$ConvenienceReqDataFromJson(Map<String, dynamic> json) =>
    ConvenienceReqData(
      aParam: json['aParam'] as String?,
      amount: json['amount'] as String?,
      mobile: json['mobile'] as String?,
      service: json['service'] as String?,
      version: json['version'] as bool?,
      categories: json['categories'] as String?,
    );

Map<String, dynamic> _$ConvenienceReqDataToJson(ConvenienceReqData instance) =>
    <String, dynamic>{
      'aParam': instance.aParam,
      'amount': instance.amount,
      'mobile': instance.mobile,
      'service': instance.service,
      'version': instance.version,
      'categories': instance.categories,
    };

ConvenienceFeeResData _$ConvenienceFeeResDataFromJson(
        Map<String, dynamic> json) =>
    ConvenienceFeeResData(
      status: json['status'] as String?,
      msg: json['msg'] as String?,
      pg: json['PG'] == null
          ? null
          : PaymentGatewayFee.fromJson(json['PG'] as Map<String, dynamic>),
      activatePg: json['activate_pg'] as String?,
      upi: json['UPI'] == null
          ? null
          : PaymentGatewayFee.fromJson(json['UPI'] as Map<String, dynamic>),
      pgDc: json['PG_DC'] == null
          ? null
          : PaymentGatewayFee.fromJson(json['PG_DC'] as Map<String, dynamic>),
      pgCc: json['PG_CC'] == null
          ? null
          : PaymentGatewayFee.fromJson(json['PG_CC'] as Map<String, dynamic>),
      wallet: json['WALLET'] == null
          ? null
          : PaymentGatewayFee.fromJson(json['WALLET'] as Map<String, dynamic>),
      netbanking: json['NETBANKING'] == null
          ? null
          : PaymentGatewayFee.fromJson(
              json['NETBANKING'] as Map<String, dynamic>),
      otherWallets: json['OTHERWALLETS'] == null
          ? null
          : PaymentGatewayFee.fromJson(
              json['OTHERWALLETS'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConvenienceFeeResDataToJson(
        ConvenienceFeeResData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'PG': instance.pg,
      'activate_pg': instance.activatePg,
      'UPI': instance.upi,
      'PG_DC': instance.pgDc,
      'PG_CC': instance.pgCc,
      'WALLET': instance.wallet,
      'NETBANKING': instance.netbanking,
      'OTHERWALLETS': instance.otherWallets,
    };

PaymentGatewayFee _$PaymentGatewayFeeFromJson(Map<String, dynamic> json) =>
    PaymentGatewayFee(
      feeRate: json['fee_rate'] as String?,
      pgName: json['pg_name'] as String?,
      shortText: json['short_text'] as String?,
      longText: json['long_text'] as String?,
    );

Map<String, dynamic> _$PaymentGatewayFeeToJson(PaymentGatewayFee instance) =>
    <String, dynamic>{
      'fee_rate': instance.feeRate,
      'pg_name': instance.pgName,
      'short_text': instance.shortText,
      'long_text': instance.longText,
    };
