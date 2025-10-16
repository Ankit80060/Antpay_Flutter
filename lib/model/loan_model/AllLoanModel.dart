import 'package:json_annotation/json_annotation.dart';

part 'AllLoanModel.g.dart';

@JsonSerializable()
class AllLoansModel {
  @JsonKey(name: "aParam")
  String? aParam;

  @JsonKey(name: "status")
  final int? status;

  @JsonKey(name: "msg")
  final String? msg;

  @JsonKey(name: "loanlist")
  final LoanListsModel? loanList;

  AllLoansModel({
    this.aParam,
    this.status,
    this.msg,
    this.loanList,
  });

  factory AllLoansModel.fromJson(Map<String, dynamic> json) =>
      _$AllLoansModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllLoansModelToJson(this);
}

@JsonSerializable()
class LoanListsModel {
  @JsonKey(name: "my_loans", defaultValue: [])
  final List<AllLoansSingleEntity> myLoans;

  @JsonKey(name: "business_loans", defaultValue: [])
  final List<AllLoansSingleEntity> businessLoans;

  LoanListsModel({
    required this.myLoans,
    required this.businessLoans,
  });

  factory LoanListsModel.fromJson(Map<String, dynamic> json) =>
      _$LoanListsModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoanListsModelToJson(this);
}

@JsonSerializable()
class AllLoansSingleEntity {
  @JsonKey(name: "id")
  final String? id;

  @JsonKey(name: "user_id")
  final String? userId;

  @JsonKey(name: "loan_type_name")
  final String? loanTypeName;

  @JsonKey(name: "loan_type_id")
  final String? loanTypeId;

  @JsonKey(name: "loan_amount")
  final String? loanAmount;

  @JsonKey(name: "updated_on")
  final String? updatedOn;

  @JsonKey(name: "loanStatus")
  final String? loanStatus;

  @JsonKey(name: "loan_id")
  final String? loan_id;

  @JsonKey(name: "lender", defaultValue: [])
  final List<LenderDetail> lenderDetails;

  AllLoansSingleEntity({
    this.id,
    this.userId,
    this.loanTypeName,
    this.loanTypeId,
    this.loanAmount,
    this.updatedOn,
    this.loanStatus,
    this.loan_id,
    required this.lenderDetails,
  });

  factory AllLoansSingleEntity.fromJson(Map<String, dynamic> json) =>
      _$AllLoansSingleEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AllLoansSingleEntityToJson(this);
}

@JsonSerializable()
class LenderDetail {
  @JsonKey(name: "lender_name", defaultValue: "")
  final String? lender_name;

  @JsonKey(name: "lender_status", defaultValue: "")
  final String? lender_status;

  LenderDetail({
    this.lender_name,
    this.lender_status,
  });

  factory LenderDetail.fromJson(Map<String, dynamic> json) =>
      _$LenderDetailFromJson(json);

  Map<String, dynamic> toJson() => _$LenderDetailToJson(this);
}