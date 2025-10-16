// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoanRequestModel _$LoanRequestModelFromJson(Map<String, dynamic> json) =>
    LoanRequestModel(
      aParam: json['aParam'] as String? ?? '',
      userData: UserData.fromJson(json['userData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoanRequestModelToJson(LoanRequestModel instance) =>
    <String, dynamic>{
      'aParam': instance.aParam,
      'userData': instance.userData,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      min_rate: json['min_rate'] as String?,
      min_loan_amount: json['min_loan_amount'] as String?,
      loanType: json['loan_type'] as String?,
      loanName: json['loan_name'] as String?,
      state: json['state'] as String?,
      city: json['city'] as String?,
      gender: json['gender'] as String?,
      dob: json['dob'] as String?,
      maritalstatus: json['maritalstatus'] as String?,
      nationality: json['nationality'] as String?,
      qualification: json['qualification'] as String?,
      occupation: json['occupation'] as String?,
      companyType: json['company_type'] as String?,
      companyName: json['company_name'] as String?,
      modeOfSalary: json['mode_of_salary'] as String?,
      bankName: json['bankName'] as String?,
      emi: json['emi'] as String?,
      income: json['income'] as String?,
      professionType: json['professionType'] as String?,
      netWorth: json['netWorth'] as String?,
      totalExperience: json['totalExperience'] as String?,
      turnover1: json['turnover1'] as String?,
      turnover2: json['turnover2'] as String?,
      turnover3: json['turnover3'] as String?,
      ownerShip: json['ownerShip'] as String?,
      auditDone: json['auditDone'] as String?,
      defaultedOnLoanCard: json['defaultedOnLoanCard'] as String?,
      industryType: json['industryType'] as String?,
      officePhoneNumber: json['officePhoneNumber'] as String?,
      amount: json['amount'] as String?,
      propertyType: json['property_type'] as String?,
      dateOfIncorporation: json['dateOfIncorporation'] as String?,
      cin: json['CIN'] as String?,
      chequeBouncedInLastSixMonth:
          json['chequeBouncedInLastSixMonth'] as String?,
      ratedByFinancialAgency: json['ratedByFinancialAgency'] as String?,
      cibilScore: json['cibil_score'] as String?,
      propertyValue: json['property_value'] as String?,
      locationOfPropertyPincode:
          json['location_of_property_pincode'] as String?,
      builderName: json['builder_name'] as String?,
      appName: json['appName'] as String?,
      personalDetails: json['personalDetails'] == null
          ? null
          : PersonalDetails.fromJson(
              json['personalDetails'] as Map<String, dynamic>),
      carBrand: json['car_brand'] as String?,
      carModel: json['car_model'] as String?,
      carType: json['car_type'] as String?,
      rto: json['rto'] as String?,
      identifiedTheCar: json['identified_the_car'] as String?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'loan_type': instance.loanType,
      'loan_name': instance.loanName,
      'state': instance.state,
      'city': instance.city,
      'gender': instance.gender,
      'dob': instance.dob,
      'maritalstatus': instance.maritalstatus,
      'nationality': instance.nationality,
      'qualification': instance.qualification,
      'occupation': instance.occupation,
      'company_type': instance.companyType,
      'company_name': instance.companyName,
      'mode_of_salary': instance.modeOfSalary,
      'bankName': instance.bankName,
      'emi': instance.emi,
      'income': instance.income,
      'professionType': instance.professionType,
      'netWorth': instance.netWorth,
      'totalExperience': instance.totalExperience,
      'turnover1': instance.turnover1,
      'turnover2': instance.turnover2,
      'turnover3': instance.turnover3,
      'ownerShip': instance.ownerShip,
      'auditDone': instance.auditDone,
      'defaultedOnLoanCard': instance.defaultedOnLoanCard,
      'industryType': instance.industryType,
      'officePhoneNumber': instance.officePhoneNumber,
      'amount': instance.amount,
      'property_type': instance.propertyType,
      'dateOfIncorporation': instance.dateOfIncorporation,
      'CIN': instance.cin,
      'chequeBouncedInLastSixMonth': instance.chequeBouncedInLastSixMonth,
      'ratedByFinancialAgency': instance.ratedByFinancialAgency,
      'cibil_score': instance.cibilScore,
      'property_value': instance.propertyValue,
      'location_of_property_pincode': instance.locationOfPropertyPincode,
      'builder_name': instance.builderName,
      'appName': instance.appName,
      'personalDetails': instance.personalDetails,
      'identified_the_car': instance.identifiedTheCar,
      'car_type': instance.carType,
      'car_brand': instance.carBrand,
      'car_model': instance.carModel,
      'rto': instance.rto,
      'min_rate': instance.min_rate,
      'min_loan_amount': instance.min_loan_amount,
    };

PersonalDetails _$PersonalDetailsFromJson(Map<String, dynamic> json) =>
    PersonalDetails(
      phone: json['phone'] as String,
      email: json['email'] as String?,
      phoneVerified: json['phone_verified'] as bool?,
      consumerBureauPullConsent: json['consumer_bureau_pull_consent'] as bool?,
      termsAccepted: json['terms_accepted'] as bool?,
      name: json['name'] as String,
      pan: json['pan'] as String?,
    );

Map<String, dynamic> _$PersonalDetailsToJson(PersonalDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'phone_verified': instance.phoneVerified,
      'consumer_bureau_pull_consent': instance.consumerBureauPullConsent,
      'terms_accepted': instance.termsAccepted,
      'pan': instance.pan,
    };
