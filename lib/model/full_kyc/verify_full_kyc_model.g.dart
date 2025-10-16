// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_full_kyc_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyFullKycRequest _$VerifyFullKycRequestFromJson(
        Map<String, dynamic> json) =>
    VerifyFullKycRequest(
      kycUniqueId: json['kyc_unique_id'] as String?,
      mobile: json['mobile'] as String?,
      fullName: json['fullname'] as String?,
      email: json['email'] as String?,
      pan: json['pan'] as String?,
      aadhar: json['aadhar'] as String?,
      accountNo: json['account_no'] as String?,
      cAccountNo: json['caccount_no'] as String?,
      bankName: json['bank_name'] as String?,
      ifsc: json['ifsc_code'] as String?,
      userType: json['user_type'] as String?,
      source: json['source'] as String?,
      product: json['product'] as String?,
      otp: json['otp'] as String?,
      transactionId: json['transactionId'] as String?,
      codeVerifier: json['codeVerifier'] as String?,
      fwdp: json['fwdp'] as String?,
      validateXml: json['validateXml'] as bool?,
    );

Map<String, dynamic> _$VerifyFullKycRequestToJson(
        VerifyFullKycRequest instance) =>
    <String, dynamic>{
      'kyc_unique_id': instance.kycUniqueId,
      'mobile': instance.mobile,
      'fullname': instance.fullName,
      'email': instance.email,
      'pan': instance.pan,
      'aadhar': instance.aadhar,
      'account_no': instance.accountNo,
      'caccount_no': instance.cAccountNo,
      'bank_name': instance.bankName,
      'ifsc_code': instance.ifsc,
      'user_type': instance.userType,
      'source': instance.source,
      'product': instance.product,
      'otp': instance.otp,
      'transactionId': instance.transactionId,
      'codeVerifier': instance.codeVerifier,
      'fwdp': instance.fwdp,
      'validateXml': instance.validateXml,
    };

VerifyFullKycResponse _$VerifyFullKycResponseFromJson(
        Map<String, dynamic> json) =>
    VerifyFullKycResponse(
      status: json['status'],
      response: json['response'] == null
          ? null
          : KYCResponse.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VerifyFullKycResponseToJson(
        VerifyFullKycResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'response': instance.response,
    };

KYCResponse _$KYCResponseFromJson(Map<String, dynamic> json) => KYCResponse(
      aadharKyc: json['aadhar_kyc'] == null
          ? null
          : AadharKyc.fromJson(json['aadhar_kyc'] as Map<String, dynamic>),
      panKyc: json['pan_kyc'] == null
          ? null
          : PanKyc.fromJson(json['pan_kyc'] as Map<String, dynamic>),
      bankKyc: json['bank_kyc'] == null
          ? null
          : BankKyc.fromJson(json['bank_kyc'] as Map<String, dynamic>),
      kycUserDetails: json['kyc_user_details'] == null
          ? null
          : KycUserDetails.fromJson(
              json['kyc_user_details'] as Map<String, dynamic>),
    )
      ..status = json['status']
      ..msg = json['msg'] as String?;

Map<String, dynamic> _$KYCResponseToJson(KYCResponse instance) =>
    <String, dynamic>{
      'aadhar_kyc': instance.aadharKyc,
      'pan_kyc': instance.panKyc,
      'bank_kyc': instance.bankKyc,
      'kyc_user_details': instance.kycUserDetails,
      'status': instance.status,
      'msg': instance.msg,
    };

AadharKyc _$AadharKycFromJson(Map<String, dynamic> json) => AadharKyc(
      status: json['status'],
      msg: json['msg'] as String?,
      nameMatch: json['name_match'],
      dataType: json['dataType'] as String?,
    );

Map<String, dynamic> _$AadharKycToJson(AadharKyc instance) => <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'name_match': instance.nameMatch,
      'dataType': instance.dataType,
    };

PanKyc _$PanKycFromJson(Map<String, dynamic> json) => PanKyc(
      status: json['status'],
      msg: json['msg'] as String?,
      nameMatch: json['name_match'],
      dataType: json['dataType'] as String?,
    );

Map<String, dynamic> _$PanKycToJson(PanKyc instance) => <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'name_match': instance.nameMatch,
      'dataType': instance.dataType,
    };

BankKyc _$BankKycFromJson(Map<String, dynamic> json) => BankKyc(
      status: json['status'],
      msg: json['msg'] as String?,
      nameMatch: json['name_match'],
      dataType: json['dataType'] as String?,
    );

Map<String, dynamic> _$BankKycToJson(BankKyc instance) => <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'name_match': instance.nameMatch,
      'dataType': instance.dataType,
    };

KycUserDetails _$KycUserDetailsFromJson(Map<String, dynamic> json) =>
    KycUserDetails(
      userType: json['user_type'] as String?,
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$KycUserDetailsToJson(KycUserDetails instance) =>
    <String, dynamic>{
      'user_type': instance.userType,
      'user_id': instance.userId,
    };
