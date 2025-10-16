// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lender_invesstment_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LenderInvestmentDetailsRequestModel
    _$LenderInvestmentDetailsRequestModelFromJson(Map<String, dynamic> json) =>
        LenderInvestmentDetailsRequestModel(
          phone: json['phone'] as String?,
          lenderId: json['lender_id'] as String?,
          source: json['source'] as String?,
        );

Map<String, dynamic> _$LenderInvestmentDetailsRequestModelToJson(
        LenderInvestmentDetailsRequestModel instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'lender_id': instance.lenderId,
      'source': instance.source,
    };

LenderInvestmentDetailsResponseModel
    _$LenderInvestmentDetailsResponseModelFromJson(Map<String, dynamic> json) =>
        LenderInvestmentDetailsResponseModel(
          status: json['status'],
          investment_details: json['investment_details'] == null
              ? null
              : InvestmentDetails.fromJson(
                  json['investment_details'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$LenderInvestmentDetailsResponseModelToJson(
        LenderInvestmentDetailsResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'investment_details': instance.investment_details,
    };

InvestmentDetails _$InvestmentDetailsFromJson(Map<String, dynamic> json) =>
    InvestmentDetails(
      current_investment: (json['current_investment'] as List<dynamic>?)
          ?.map((e) => CurrentInvestment.fromJson(e as Map<String, dynamic>))
          .toList(),
      past_investment: (json['past_investment'] as List<dynamic>?)
          ?.map((e) => PastInvestment.fromJson(e as Map<String, dynamic>))
          .toList(),
      total_investment_amount:
          (json['total_investment_amount'] as num?)?.toDouble(),
      total_current_value: (json['total_current_value'] as num?)?.toDouble(),
      total_return: (json['total_return'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$InvestmentDetailsToJson(InvestmentDetails instance) =>
    <String, dynamic>{
      'current_investment': instance.current_investment,
      'past_investment': instance.past_investment,
      'total_investment_amount': instance.total_investment_amount,
      'total_current_value': instance.total_current_value,
      'total_return': instance.total_return,
    };

CurrentInvestment _$CurrentInvestmentFromJson(Map<String, dynamic> json) =>
    CurrentInvestment(
      investmentNo: json['investment_No'] as String?,
      schemeName: json['scheme_name'] as String?,
      lockin: json['lockin'] as String?,
      amount: json['amount'] as String?,
      basicRate: json['basic_rate'] as String?,
      hikeRate: json['hike_rate'] as String?,
      preMatRate: json['pre_mat_rate'] as String?,
      noOfDays: (json['no_of_days'] as num?)?.toInt(),
      interestPerday: (json['interest_perday'] as num?)?.toDouble(),
      finalInterest: (json['final_interest'] as num?)?.toDouble(),
      currentValue: (json['current_value'] as num?)?.toDouble(),
      investmentDate: json['investment_date'] as String?,
      redemptionDate: json['redemption_date'] as String?,
      redemptionStatus: json['redemption_status'] as String?,
    );

Map<String, dynamic> _$CurrentInvestmentToJson(CurrentInvestment instance) =>
    <String, dynamic>{
      'investment_No': instance.investmentNo,
      'scheme_name': instance.schemeName,
      'lockin': instance.lockin,
      'amount': instance.amount,
      'basic_rate': instance.basicRate,
      'hike_rate': instance.hikeRate,
      'pre_mat_rate': instance.preMatRate,
      'no_of_days': instance.noOfDays,
      'interest_perday': instance.interestPerday,
      'final_interest': instance.finalInterest,
      'current_value': instance.currentValue,
      'investment_date': instance.investmentDate,
      'redemption_date': instance.redemptionDate,
      'redemption_status': instance.redemptionStatus,
    };

PastInvestment _$PastInvestmentFromJson(Map<String, dynamic> json) =>
    PastInvestment(
      investmentNo: json['investment_No'] as String?,
      schemeName: json['scheme_name'] as String?,
      amount: json['amount'] as String?,
      noOfDays: json['no_of_days'] as String?,
      finalInterest: json['final_interest'] as String?,
      currentValue: json['current_value'] as String?,
      investmentDate: json['investment_date'] as String?,
      redemptionDate: json['redemption_date'] as String?,
      redemptionStatus: json['redemption_status'] as String?,
    );

Map<String, dynamic> _$PastInvestmentToJson(PastInvestment instance) =>
    <String, dynamic>{
      'investment_No': instance.investmentNo,
      'scheme_name': instance.schemeName,
      'amount': instance.amount,
      'no_of_days': instance.noOfDays,
      'final_interest': instance.finalInterest,
      'current_value': instance.currentValue,
      'investment_date': instance.investmentDate,
      'redemption_date': instance.redemptionDate,
      'redemption_status': instance.redemptionStatus,
    };
