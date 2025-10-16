import 'package:json_annotation/json_annotation.dart';

part 'convenience_model.g.dart';

// Req Model

@JsonSerializable()
class ConvenienceReqData {
  @JsonKey(name: 'aParam')
  String? aParam;

  @JsonKey(name: 'amount')
  String? amount;

  @JsonKey(name: 'mobile')
  String? mobile;

  @JsonKey(name: 'service')
  String? service;

  @JsonKey(name: 'version')
  bool? version;
    @JsonKey(name: 'categories')
  String? categories;

  ConvenienceReqData({
    this.aParam,
    this.amount,
    this.mobile,
    this.service,
    this.version,
    this.categories,
  });

  factory ConvenienceReqData.fromJson(Map<String, dynamic> json) =>
      _$ConvenienceReqDataFromJson(json);

  Map<String, dynamic> toJson() => _$ConvenienceReqDataToJson(this);
}

// Res model

@JsonSerializable()
class ConvenienceFeeResData {
  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'msg')
  String? msg;

  @JsonKey(name: 'PG')
  PaymentGatewayFee? pg;

  @JsonKey(name: 'activate_pg')
  String? activatePg;

  @JsonKey(name: 'UPI')
  PaymentGatewayFee? upi;

  @JsonKey(name: 'PG_DC')
  PaymentGatewayFee? pgDc;

  @JsonKey(name: 'PG_CC')
  PaymentGatewayFee? pgCc;

  @JsonKey(name: 'WALLET')
  PaymentGatewayFee? wallet;

  @JsonKey(name: 'NETBANKING')
  PaymentGatewayFee? netbanking;

  @JsonKey(name: 'OTHERWALLETS')
  PaymentGatewayFee? otherWallets;

  ConvenienceFeeResData({
    this.status,
    this.msg,
    this.pg,
    this.activatePg,
    this.upi,
    this.pgDc,
    this.pgCc,
    this.wallet,
    this.netbanking,
    this.otherWallets,
  });

  factory ConvenienceFeeResData.fromJson(Map<String, dynamic> json) =>
      _$ConvenienceFeeResDataFromJson(json);

  Map<String, dynamic> toJson() => _$ConvenienceFeeResDataToJson(this);
}

@JsonSerializable()
class PaymentGatewayFee {
  @JsonKey(name: 'fee_rate')
  String? feeRate;

  @JsonKey(name: 'pg_name')
  String? pgName;

  @JsonKey(name: 'short_text')
  String? shortText;

  @JsonKey(name: 'long_text')
  String? longText;

  PaymentGatewayFee({
    this.feeRate,
    this.pgName,
    this.shortText,
    this.longText,
  });

  factory PaymentGatewayFee.fromJson(Map<String, dynamic> json) =>
      _$PaymentGatewayFeeFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentGatewayFeeToJson(this);
}

