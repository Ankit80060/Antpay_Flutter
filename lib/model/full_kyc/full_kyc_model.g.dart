// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_kyc_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FullKycRequest _$FullKycRequestFromJson(Map<String, dynamic> json) =>
    FullKycRequest(
      mobile: json['mobile'] as String?,
      fullName: json['fullname'] as String?,
      email: json['email'] as String?,
      pan: json['pan'] as String?,
      aadhar: json['aadhar'] as String?,
      dob: json['dob'] as String?,
      gender: json['gender'] as String?,
      accountNo: json['account_no'] as String?,
      cAccountNo: json['caccount_no'] as String?,
      bankName: json['bank_name'] as String?,
      ifsc: json['ifsc_code'] as String?,
      occuption_id: json['occuption_id'] as String?,
      company_type: json['company_type'] as String?,
      company_name: json['company_name'] as String?,
      company_code: json['company_code'] as String?,
      highest_qualification: json['highest_qualification'] as String?,
      net_monthly_income: json['net_monthly_income'] as String?,
      r_pincode: json['r_pincode'] as String?,
      r_state: json['r_state'] as String?,
      r_city: json['r_city'] as String?,
      userType: json['user_type'] as String?,
      source: json['source'] as String?,
      product: json['product'] as String?,
    );

Map<String, dynamic> _$FullKycRequestToJson(FullKycRequest instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'fullname': instance.fullName,
      'email': instance.email,
      'pan': instance.pan,
      'aadhar': instance.aadhar,
      'dob': instance.dob,
      'gender': instance.gender,
      'r_pincode': instance.r_pincode,
      'r_state': instance.r_state,
      'r_city': instance.r_city,
      'account_no': instance.accountNo,
      'caccount_no': instance.cAccountNo,
      'bank_name': instance.bankName,
      'ifsc_code': instance.ifsc,
      'occuption_id': instance.occuption_id,
      'company_type': instance.company_type,
      'company_name': instance.company_name,
      'company_code': instance.company_code,
      'highest_qualification': instance.highest_qualification,
      'net_monthly_income': instance.net_monthly_income,
      'user_type': instance.userType,
      'source': instance.source,
      'product': instance.product,
    };

KycResponse _$KycResponseFromJson(Map<String, dynamic> json) => KycResponse(
      user_details: json['user_details'] == null
          ? null
          : UserDetailResp.fromJson(
              json['user_details'] as Map<String, dynamic>),
      kycResponse: json['aadhar_kyc'] == null
          ? null
          : FullKycResponse.fromJson(
              json['aadhar_kyc'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KycResponseToJson(KycResponse instance) =>
    <String, dynamic>{
      'user_details': instance.user_details,
      'aadhar_kyc': instance.kycResponse,
    };

UserDetailResp _$UserDetailRespFromJson(Map<String, dynamic> json) =>
    UserDetailResp(
      user_type: json['user_type'] as String?,
      user_id: json['user_id'],
    );

Map<String, dynamic> _$UserDetailRespToJson(UserDetailResp instance) =>
    <String, dynamic>{
      'user_type': instance.user_type,
      'user_id': instance.user_id,
    };

FullKycResponse _$FullKycResponseFromJson(Map<String, dynamic> json) =>
    FullKycResponse(
      kycUniqueId: json['kyc_unique_id'] as String?,
      aadharResponse: json['aadhar_response'] == null
          ? null
          : AadharResponse.fromJson(
              json['aadhar_response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FullKycResponseToJson(FullKycResponse instance) =>
    <String, dynamic>{
      'kyc_unique_id': instance.kycUniqueId,
      'aadhar_response': instance.aadharResponse,
    };

AadharResponse _$AadharResponseFromJson(Map<String, dynamic> json) =>
    AadharResponse(
      code: json['code'] as String?,
      model: json['model'] == null
          ? null
          : ResponseModel.fromJson(json['model'] as Map<String, dynamic>),
      msg: json['msg'] as String?,
      errorCode: json['errorCode'] as String?,
    );

Map<String, dynamic> _$AadharResponseToJson(AadharResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'model': instance.model,
      'msg': instance.msg,
      'errorCode': instance.errorCode,
    };

ResponseModel _$ResponseModelFromJson(Map<String, dynamic> json) =>
    ResponseModel(
      adharNumber: json['adharNumber'] as String?,
      uniqueId: json['uniqueId'] as String?,
      referenceId: json['referenceId'] as String?,
      maskedAdharNumber: json['maskedAdharNumber'] as String?,
      name: json['name'] as String?,
      gender: json['gender'] as String?,
      dob: json['dob'] as String?,
      careOf: json['careOf'] as String?,
      passCode: json['passCode'] as String?,
      link: json['link'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      image: json['image'] as String?,
      transactionId: json['transactionId'] as String?,
      fwdp: json['fwdp'] as String?,
      codeVerifier: json['codeVerifier'] as String?,
      uidaiResponse: json['uidaiResponse'] == null
          ? null
          : UidaiResponse.fromJson(
              json['uidaiResponse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseModelToJson(ResponseModel instance) =>
    <String, dynamic>{
      'adharNumber': instance.adharNumber,
      'uniqueId': instance.uniqueId,
      'referenceId': instance.referenceId,
      'maskedAdharNumber': instance.maskedAdharNumber,
      'name': instance.name,
      'gender': instance.gender,
      'dob': instance.dob,
      'careOf': instance.careOf,
      'passCode': instance.passCode,
      'link': instance.link,
      'address': instance.address,
      'image': instance.image,
      'transactionId': instance.transactionId,
      'fwdp': instance.fwdp,
      'codeVerifier': instance.codeVerifier,
      'uidaiResponse': instance.uidaiResponse,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      house: json['house'] as String?,
      street: json['street'] as String?,
      landmark: json['landmark'] as String?,
      loc: json['loc'] as String?,
      po: json['po'] as String?,
      dist: json['dist'] as String?,
      subdist: json['subdist'] as String?,
      vtc: json['vtc'] as String?,
      pc: json['pc'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'house': instance.house,
      'street': instance.street,
      'landmark': instance.landmark,
      'loc': instance.loc,
      'po': instance.po,
      'dist': instance.dist,
      'subdist': instance.subdist,
      'vtc': instance.vtc,
      'pc': instance.pc,
      'state': instance.state,
      'country': instance.country,
    };

UidaiResponse _$UidaiResponseFromJson(Map<String, dynamic> json) =>
    UidaiResponse(
      message: json['message'] as String?,
      sessionActive: json['sessionActive'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$UidaiResponseToJson(UidaiResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'sessionActive': instance.sessionActive,
      'status': instance.status,
    };
