import 'package:json_annotation/json_annotation.dart';

part 'loan_request_model.g.dart';

@JsonSerializable()
class LoanRequestModel {
  @JsonKey(name: 'aParam')
  String aParam = '';

  @JsonKey(name: 'userData')
  final UserData userData;

  LoanRequestModel({this.aParam = '', required this.userData});

  factory LoanRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoanRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoanRequestModelToJson(this);
}

@JsonSerializable()
class UserData {
  @JsonKey(name: 'loan_type')
  String? loanType;
  @JsonKey(name: 'loan_name')
  String? loanName;
  final String? state;
  final String? city;
  final String? gender;
  final String? dob;
  final String? maritalstatus;
  final String? nationality;
  final String? qualification;
  String? occupation;
  @JsonKey(name: 'company_type')
  final String? companyType;
  @JsonKey(name: 'company_name')
  final String? companyName;
  @JsonKey(name: 'mode_of_salary')
  final String? modeOfSalary;
  @JsonKey(name: 'bankName')
  String? bankName;
  final String? emi;
  String? income;
  @JsonKey(name: 'professionType')
  final String? professionType;
  @JsonKey(name: 'netWorth')
  final String? netWorth;
  @JsonKey(name: 'totalExperience')
  final String? totalExperience;
  final String? turnover1;
  final String? turnover2;
  final String? turnover3;
  @JsonKey(name: 'ownerShip')
  final String? ownerShip;
  @JsonKey(name: 'auditDone')
  final String? auditDone;
  @JsonKey(name: 'defaultedOnLoanCard')
  final String? defaultedOnLoanCard;
  @JsonKey(name: 'industryType')
  final String? industryType;
  @JsonKey(name: 'officePhoneNumber')
  final String? officePhoneNumber;
  final String? amount;
  @JsonKey(name: 'property_type')
  final String? propertyType;
  @JsonKey(name: 'dateOfIncorporation')
  final String? dateOfIncorporation;
  @JsonKey(name: 'CIN')
  final String? cin;
  @JsonKey(name: 'chequeBouncedInLastSixMonth')
  final String? chequeBouncedInLastSixMonth;
  @JsonKey(name: 'ratedByFinancialAgency')
  final String? ratedByFinancialAgency;
  @JsonKey(name: 'cibil_score')
  final String? cibilScore;
  @JsonKey(name: 'property_value')
  final String? propertyValue;
  @JsonKey(name: 'location_of_property_pincode')
  final String? locationOfPropertyPincode;
  @JsonKey(name: 'builder_name')
  final String? builderName;
  @JsonKey(name: 'appName')
  final String? appName;
  @JsonKey(name: 'personalDetails')
  PersonalDetails? personalDetails;

  @JsonKey(name: 'identified_the_car')
  final String? identifiedTheCar;

  @JsonKey(name: "car_type")
  String? carType;

  @JsonKey(name: "car_brand")
  String? carBrand;

  @JsonKey(name: "car_model")
  String? carModel;

  @JsonKey(name: "rto")
  String? rto;

  String? min_rate;
  String? min_loan_amount;

  UserData({
    this.min_rate,
    this.min_loan_amount,
    this.loanType,
    this.loanName,
    this.state,
    this.city,
    this.gender,
    this.dob,
    this.maritalstatus,
    this.nationality,
    this.qualification,
    this.occupation,
    this.companyType,
    this.companyName,
    this.modeOfSalary,
    this.bankName,
    this.emi,
    this.income,
    this.professionType,
    this.netWorth,
    this.totalExperience,
    this.turnover1,
    this.turnover2,
    this.turnover3,
    this.ownerShip,
    this.auditDone,
    this.defaultedOnLoanCard,
    this.industryType,
    this.officePhoneNumber,
    this.amount,
    this.propertyType,
    this.dateOfIncorporation,
    this.cin,
    this.chequeBouncedInLastSixMonth,
    this.ratedByFinancialAgency,
    this.cibilScore,
    this.propertyValue,
    this.locationOfPropertyPincode,
    this.builderName,
    this.appName,
    this.personalDetails,
    this.carBrand,
    this.carModel,
    this.carType,
    this.rto,
    this.identifiedTheCar,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

@JsonSerializable()
class PersonalDetails {
  String name;
  String phone;
  String? email;
  @JsonKey(name: 'phone_verified')
  bool? phoneVerified;
  @JsonKey(name: 'consumer_bureau_pull_consent')
  bool? consumerBureauPullConsent;
  @JsonKey(name: 'terms_accepted')
  bool? termsAccepted;
  String? pan;

  PersonalDetails({
    required this.phone,
    this.email,
    this.phoneVerified,
    this.consumerBureauPullConsent,
    this.termsAccepted,
    required this.name,
    this.pan,
  });

  factory PersonalDetails.fromJson(Map<String, dynamic> json) =>
      _$PersonalDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalDetailsToJson(this);
}
