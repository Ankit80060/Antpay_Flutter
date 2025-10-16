// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ppi_kyc_reg_user_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PpiRegisterUserRequest _$PpiRegisterUserRequestFromJson(
        Map<String, dynamic> json) =>
    PpiRegisterUserRequest(
      aParam: json['aParam'] as String?,
      customerId: json['customerId'] as String?,
      messageCode: json['messageCode'] as String?,
      clientTxnId: json['clientTxnId'] as String?,
      requestDateTime: json['requestDateTime'] as String?,
      customerDetails: json['customerDetails'] == null
          ? null
          : CustomerDetails.fromJson(
              json['customerDetails'] as Map<String, dynamic>),
      sorCustomerId: json['sorCustomerId'] as String?,
      addressDetails: json['addressDetails'] == null
          ? null
          : AddressDetails.fromJson(
              json['addressDetails'] as Map<String, dynamic>),
      docList: (json['docList'] as List<dynamic>?)
          ?.map((e) => DocList.fromJson(e as Map<String, dynamic>))
          .toList(),
      kycProfile: json['kycProfile'] as String?,
      riskCategory: json['riskCategory'] as String?,
      riskScore: json['riskScore'] as String?,
      form60: json['form60'] as bool?,
      productId: json['productId'] as String?,
      formFactorRequired: json['formFactorRequired'] as bool?,
      initialLoad: (json['initialLoad'] as num?)?.toInt(),
      initialLoadAmtCurrency: json['initialLoadAmtCurrency'] as String?,
      reserveField1: json['reserveField1'] as String?,
      reserveField2: json['reserveField2'] as String?,
      walletActiveDeviceID: json['walletActiveDeviceID'] as String?,
    );

Map<String, dynamic> _$PpiRegisterUserRequestToJson(
        PpiRegisterUserRequest instance) =>
    <String, dynamic>{
      'aParam': instance.aParam,
      'customerId': instance.customerId,
      'messageCode': instance.messageCode,
      'clientTxnId': instance.clientTxnId,
      'requestDateTime': instance.requestDateTime,
      'customerDetails': instance.customerDetails?.toJson(),
      'sorCustomerId': instance.sorCustomerId,
      'addressDetails': instance.addressDetails?.toJson(),
      'docList': instance.docList?.map((e) => e.toJson()).toList(),
      'kycProfile': instance.kycProfile,
      'riskCategory': instance.riskCategory,
      'riskScore': instance.riskScore,
      'form60': instance.form60,
      'productId': instance.productId,
      'formFactorRequired': instance.formFactorRequired,
      'initialLoad': instance.initialLoad,
      'initialLoadAmtCurrency': instance.initialLoadAmtCurrency,
      'reserveField1': instance.reserveField1,
      'reserveField2': instance.reserveField2,
      'walletActiveDeviceID': instance.walletActiveDeviceID,
    };

CustomerDetails _$CustomerDetailsFromJson(Map<String, dynamic> json) =>
    CustomerDetails(
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      gender: json['gender'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      emailAddress: json['emailAddress'] as String?,
    );

Map<String, dynamic> _$CustomerDetailsToJson(CustomerDetails instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth,
      'mobileNumber': instance.mobileNumber,
      'emailAddress': instance.emailAddress,
    };

AddressDetails _$AddressDetailsFromJson(Map<String, dynamic> json) =>
    AddressDetails(
      address1: json['address1'] as String?,
      address2: json['address2'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      zipCode: json['zipCode'] as String?,
    );

Map<String, dynamic> _$AddressDetailsToJson(AddressDetails instance) =>
    <String, dynamic>{
      'address1': instance.address1,
      'address2': instance.address2,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'zipCode': instance.zipCode,
    };

DocList _$DocListFromJson(Map<String, dynamic> json) => DocList(
      ovdType: json['ovdType'] as String?,
      ovdNo: json['ovdNo'] as String?,
    );

Map<String, dynamic> _$DocListToJson(DocList instance) => <String, dynamic>{
      'ovdType': instance.ovdType,
      'ovdNo': instance.ovdNo,
    };
