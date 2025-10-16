// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AllLoanModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllLoansModel _$AllLoansModelFromJson(Map<String, dynamic> json) =>
    AllLoansModel(
      aParam: json['aParam'] as String?,
      status: (json['status'] as num?)?.toInt(),
      msg: json['msg'] as String?,
      loanList: json['loanlist'] == null
          ? null
          : LoanListsModel.fromJson(json['loanlist'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AllLoansModelToJson(AllLoansModel instance) =>
    <String, dynamic>{
      'aParam': instance.aParam,
      'status': instance.status,
      'msg': instance.msg,
      'loanlist': instance.loanList,
    };

LoanListsModel _$LoanListsModelFromJson(Map<String, dynamic> json) =>
    LoanListsModel(
      myLoans: (json['my_loans'] as List<dynamic>?)
              ?.map((e) =>
                  AllLoansSingleEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      businessLoans: (json['business_loans'] as List<dynamic>?)
              ?.map((e) =>
                  AllLoansSingleEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$LoanListsModelToJson(LoanListsModel instance) =>
    <String, dynamic>{
      'my_loans': instance.myLoans,
      'business_loans': instance.businessLoans,
    };

AllLoansSingleEntity _$AllLoansSingleEntityFromJson(
        Map<String, dynamic> json) =>
    AllLoansSingleEntity(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      loanTypeName: json['loan_type_name'] as String?,
      loanTypeId: json['loan_type_id'] as String?,
      loanAmount: json['loan_amount'] as String?,
      updatedOn: json['updated_on'] as String?,
      loanStatus: json['loanStatus'] as String?,
      loan_id: json['loan_id'] as String?,
      lenderDetails: (json['lender'] as List<dynamic>?)
              ?.map((e) => LenderDetail.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$AllLoansSingleEntityToJson(
        AllLoansSingleEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'loan_type_name': instance.loanTypeName,
      'loan_type_id': instance.loanTypeId,
      'loan_amount': instance.loanAmount,
      'updated_on': instance.updatedOn,
      'loanStatus': instance.loanStatus,
      'loan_id': instance.loan_id,
      'lender': instance.lenderDetails,
    };

LenderDetail _$LenderDetailFromJson(Map<String, dynamic> json) => LenderDetail(
      lender_name: json['lender_name'] as String? ?? '',
      lender_status: json['lender_status'] as String? ?? '',
    );

Map<String, dynamic> _$LenderDetailToJson(LenderDetail instance) =>
    <String, dynamic>{
      'lender_name': instance.lender_name,
      'lender_status': instance.lender_status,
    };
