
import 'package:json_annotation/json_annotation.dart';

part 'lender_investment_model_.g.dart';

@JsonSerializable()
class LenderInvestmentRequestModel{

  LenderInvestmentRequestModel({
    this.lender_id,
    this.phone,
    this.amount,
    this.scheme_id,
    this.ant_txn_id,
    this.source
});

  @JsonKey(name:'lender_id')
  String? lender_id;

  @JsonKey(name:'phone')
  String? phone;

  @JsonKey(name:'amount')
  String? amount;

  @JsonKey(name:'scheme_id')
  String? scheme_id;

  @JsonKey(name:'ant_txn_id')
  String? ant_txn_id;

  @JsonKey(name:'source')
  String? source;

  factory LenderInvestmentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LenderInvestmentRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$LenderInvestmentRequestModelToJson(this);

}

@JsonSerializable()
class LenderInvestmentResponseModel{
  LenderInvestmentResponseModel({
    this.status,
    this.investment_no,
    this.msg
});

  @JsonKey(name:'status')
  dynamic status;

  @JsonKey(name:'investment_no')
  String? investment_no;

  @JsonKey(name:'msg')
  String? msg;

  factory LenderInvestmentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LenderInvestmentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LenderInvestmentResponseModelToJson(this);

}