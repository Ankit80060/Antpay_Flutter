import 'package:json_annotation/json_annotation.dart';

part 'scheme_investment_model.g.dart';

@JsonSerializable()
class SchemesInvestmentRequestModel {
  SchemesInvestmentRequestModel({
    this.phone,
    this.vendor_id,
    this.source,
  });

  @JsonKey(name: 'phone')
  String? phone;

  @JsonKey(name: 'vendor_id')
  String? vendor_id;

  @JsonKey(name: 'source')
  String? source;

  factory SchemesInvestmentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SchemesInvestmentRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SchemesInvestmentRequestModelToJson(this);
}

@JsonSerializable()
class SchemesInvestmentResponseModel {
  SchemesInvestmentResponseModel({
    this.status,
    this.schemesList,
    this.kyc_status,
  });

  @JsonKey(name: 'status')
  dynamic status;

  @JsonKey(name: 'schemes')
  List<Schemes>? schemesList;

  @JsonKey(name: 'kyc_status')
  KycStatus? kyc_status;

  factory SchemesInvestmentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SchemesInvestmentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SchemesInvestmentResponseModelToJson(this);
}

@JsonSerializable()
class KycStatus {
  KycStatus({
    this.lender_id,
    this.step,
    this.msg,
  });

  @JsonKey(name: 'lender_id')
  String? lender_id;

  @JsonKey(name: 'step')
  dynamic step;

  @JsonKey(name: 'msg')
  String? msg;

  factory KycStatus.fromJson(Map<String, dynamic> json) =>
      _$KycStatusFromJson(json);

  Map<String, dynamic> toJson() => _$KycStatusToJson(this);
}

@JsonSerializable()
class Schemes {
  Schemes({
    this.scheme_id,
    this.partner_id,
    this.Scheme_Name,
    this.Min_Inv_Amount,
    this.Max_Inv_Amount,
    this.Interest_Rate,
    this.tenure,
    this.scheme_descripiton,
  });

  @JsonKey(name: 'scheme_id')
  String? scheme_id;

  @JsonKey(name: 'partner_id')
  String? partner_id;

  @JsonKey(name: 'Scheme_Name')
  String? Scheme_Name;

  @JsonKey(name: 'Min_Inv_Amount')
  String? Min_Inv_Amount;

  @JsonKey(name: 'Max_Inv_Amount')
  String? Max_Inv_Amount;

  @JsonKey(name: 'Interest_Rate')
  String? Interest_Rate;

  @JsonKey(name: 'tenure')
  String? tenure;

  @JsonKey(name: 'scheme_descripiton')
  String? scheme_descripiton;

  factory Schemes.fromJson(Map<String, dynamic> json) =>
      _$SchemesFromJson(json);

  Map<String, dynamic> toJson() => _$SchemesToJson(this);
}
