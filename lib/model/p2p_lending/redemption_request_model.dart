
import 'package:json_annotation/json_annotation.dart';
part 'redemption_request_model.g.dart';

@JsonSerializable()
class RedemptionRequestModel{
  RedemptionRequestModel({
     this.phone,
     this.investment_no,
     this.source
});



  @JsonKey(name:"phone")
  String? phone;

  @JsonKey(name:"investment_no")
  String? investment_no;

  @JsonKey(name: 'source')
  String? source;

  factory RedemptionRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RedemptionRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$RedemptionRequestModelToJson(this);


}

@JsonSerializable()
class RedemptionResponseModel{
  RedemptionResponseModel({
    this.status,
    this.redemption_request
});

  @JsonKey(name:"status")
  dynamic status;

  @JsonKey(name:"redemption_request")
  RedemptionResponse? redemption_request;

  factory RedemptionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RedemptionResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RedemptionResponseModelToJson(this);

}

@JsonSerializable()
class RedemptionResponse {
  RedemptionResponse({
    this.investmentNo,
    this.schemeName,
    this.investmentDate,
    this.redemptionDate,
    this.redemptionStatus,
    this.amount,
    this.finalAmount,
    this.interestRate,
    this.noOfDays,
    this.interestAmount,
    this.bankName,
    this.accountNumber
});

  @JsonKey(name:"investment_No")
  String? investmentNo;

  @JsonKey(name:"scheme_Name")
  String? schemeName;

  @JsonKey(name:"investment_date")
  String? investmentDate;

  @JsonKey(name:"redemption_date")
  String? redemptionDate;

  @JsonKey(name:"redemption_status")
  String? redemptionStatus;

  @JsonKey(name:"amount")
  String? amount;

  @JsonKey(name:"final_amount")
  String? finalAmount;

  @JsonKey(name:"interest_rate")
  String? interestRate;

  @JsonKey(name:"no_of_days")
  dynamic noOfDays;

  @JsonKey(name:"interest_amount")
  String? interestAmount;

  @JsonKey(name:"bank_name")
  String? bankName;

  @JsonKey(name:"account_number")
  String? accountNumber;

  factory RedemptionResponse.fromJson(Map<String, dynamic> json) =>
      _$RedemptionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RedemptionResponseToJson(this);



}