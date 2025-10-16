
import 'package:json_annotation/json_annotation.dart';

part 'lender_invesstment_details_model.g.dart';

@JsonSerializable()
class LenderInvestmentDetailsRequestModel{
  LenderInvestmentDetailsRequestModel({
    this.phone,
    this.lenderId,
    this.source,

});

  @JsonKey(name:"phone")
  String? phone;

  @JsonKey(name:"lender_id")
  String? lenderId;

  @JsonKey(name:'source')
  String? source;

  factory LenderInvestmentDetailsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LenderInvestmentDetailsRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$LenderInvestmentDetailsRequestModelToJson(this);

}

@JsonSerializable()
class LenderInvestmentDetailsResponseModel{
  LenderInvestmentDetailsResponseModel({
    this.status,
    this.investment_details
});

  @JsonKey(name:"status")
  dynamic status;

  @JsonKey(name:"investment_details")
  InvestmentDetails? investment_details;

  factory LenderInvestmentDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LenderInvestmentDetailsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LenderInvestmentDetailsResponseModelToJson(this);

}

@JsonSerializable()
class InvestmentDetails {
  InvestmentDetails({
    this.current_investment,
    this.past_investment,
    this.total_investment_amount,
    this.total_current_value,
    this.total_return
});

  @JsonKey(name:"current_investment")
  List<CurrentInvestment>? current_investment;

  @JsonKey(name:"past_investment")
  List<PastInvestment>? past_investment;

  @JsonKey(name:"total_investment_amount")
  double? total_investment_amount;

  @JsonKey(name:"total_current_value")
  double? total_current_value;

  @JsonKey(name:"total_return")
  double? total_return;

  factory InvestmentDetails.fromJson(Map<String, dynamic> json) =>
      _$InvestmentDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$InvestmentDetailsToJson(this);


}


@JsonSerializable()
class CurrentInvestment {

  CurrentInvestment({
    this.investmentNo,
    this.schemeName,
    this.lockin,
    this.amount,
    this.basicRate,
    this.hikeRate,
    this.preMatRate,
    this.noOfDays,
    this.interestPerday,
    this.finalInterest,
    this.currentValue,
    this.investmentDate,
    this.redemptionDate,
    this.redemptionStatus
  });

  @JsonKey(name:'investment_No')
  String? investmentNo;

  @JsonKey(name:'scheme_name')
  String? schemeName;

  @JsonKey(name:'lockin')
  String? lockin;

  @JsonKey(name:'amount')
  String? amount;

  @JsonKey(name:'basic_rate')
  String? basicRate;

  @JsonKey(name:'hike_rate')
  String? hikeRate;

  @JsonKey(name:'pre_mat_rate')
  String? preMatRate;

  @JsonKey(name:'no_of_days')
  int? noOfDays;

  @JsonKey(name:'interest_perday')
  double? interestPerday;

  @JsonKey(name:'final_interest')
  double? finalInterest;

  @JsonKey(name:'current_value')
  double? currentValue;

  @JsonKey(name:'investment_date')
  String? investmentDate;

  @JsonKey(name:'redemption_date')
  String? redemptionDate;

  @JsonKey(name:'redemption_status')
  String? redemptionStatus;

  factory CurrentInvestment.fromJson(Map<String, dynamic> json) =>
      _$CurrentInvestmentFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentInvestmentToJson(this);


}

@JsonSerializable()
class PastInvestment {

  PastInvestment({
    this.investmentNo,
    this.schemeName,
    this.amount,
    this.noOfDays,
    this.finalInterest,
    this.currentValue,
    this.investmentDate,
    this.redemptionDate,
    this.redemptionStatus
  });

  @JsonKey(name:"investment_No")
  String? investmentNo;

  @JsonKey(name:"scheme_name")
  String? schemeName;

  @JsonKey(name:"amount")
  String? amount;

  @JsonKey(name:"no_of_days")
  String? noOfDays;

  @JsonKey(name:"final_interest")
  String? finalInterest;

  @JsonKey(name:"current_value")
  String? currentValue;

  @JsonKey(name:"investment_date")
  String? investmentDate;

  @JsonKey(name:"redemption_date")
  String? redemptionDate;

  @JsonKey(name:"redemption_status")
  String? redemptionStatus;

  factory PastInvestment.fromJson(Map<String, dynamic> json) =>
      _$PastInvestmentFromJson(json);

  Map<String, dynamic> toJson() => _$PastInvestmentToJson(this);



}