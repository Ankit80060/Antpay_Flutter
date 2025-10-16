// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CheckUserResponseModelPayu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckUserResponseModelPayu _$CheckUserResponseModelPayuFromJson(
        Map<String, dynamic> json) =>
    CheckUserResponseModelPayu(
      isMpinSet: json['isMpinSet'] as bool?,
      mpinExpired: json['mpinExpired'] as bool?,
      migratedUserFlag: json['migratedUserFlag'] as String?,
      customerId: json['customerId'] as String?,
      responseCode: json['responseCode'] as String?,
      messageCode: (json['messageCode'] as num?)?.toInt(),
      clientTxnId: json['clientTxnId'] as String?,
      clientId: json['clientId'] as String?,
      responseDateTime: json['responseDateTime'] as String?,
      accosaTransactionId: (json['accosaTransactionId'] as num?)?.toInt(),
      responseMessage: json['responseMessage'] as String?,
      bankId: (json['bankId'] as num?)?.toInt(),
      profileId: (json['profileId'] as num?)?.toInt(),
      mobile: json['mobile'] as String?,
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      dob: json['dob'] as String?,
      kycName: json['kycName'] as String?,
      riskCategory: json['riskCategory'] as String?,
      riskScore: (json['riskScore'] as num?)?.toInt(),
      rekyc: json['rekyc'] as bool?,
      rekycValidity: json['rekycValidity'] as String?,
      form60: json['form60'] as bool?,
      panValid: json['panValid'] as bool?,
      form60Validity: json['form60Validity'] as String?,
      docList: (json['docList'] as List<dynamic>?)
          ?.map((e) => Doc.fromJson(e as Map<String, dynamic>))
          .toList(),
      cardList: (json['cardList'] as List<dynamic>?)
          ?.map((e) => PaymentCard.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..form60Expiry = json['form60Expiry'] as String?;

Map<String, dynamic> _$CheckUserResponseModelPayuToJson(
        CheckUserResponseModelPayu instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'responseCode': instance.responseCode,
      'messageCode': instance.messageCode,
      'clientTxnId': instance.clientTxnId,
      'clientId': instance.clientId,
      'responseDateTime': instance.responseDateTime,
      'accosaTransactionId': instance.accosaTransactionId,
      'responseMessage': instance.responseMessage,
      'bankId': instance.bankId,
      'profileId': instance.profileId,
      'mobile': instance.mobile,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dob': instance.dob,
      'kycName': instance.kycName,
      'riskCategory': instance.riskCategory,
      'riskScore': instance.riskScore,
      'rekyc': instance.rekyc,
      'rekycValidity': instance.rekycValidity,
      'form60': instance.form60,
      'panValid': instance.panValid,
      'form60Validity': instance.form60Validity,
      'form60Expiry': instance.form60Expiry,
      'docList': instance.docList,
      'cardList': instance.cardList,
      'isMpinSet': instance.isMpinSet,
      'mpinExpired': instance.mpinExpired,
      'migratedUserFlag': instance.migratedUserFlag,
    };

Doc _$DocFromJson(Map<String, dynamic> json) => Doc(
      docType: json['docType'] as String?,
      docNumber: json['docNumber'] as String?,
    );

Map<String, dynamic> _$DocToJson(Doc instance) => <String, dynamic>{
      'docType': instance.docType,
      'docNumber': instance.docNumber,
    };

PaymentCard _$PaymentCardFromJson(Map<String, dynamic> json) => PaymentCard(
      cardNumber: json['cardNumber'] as String?,
      lastFourDigit: json['lastFourDigit'] as String?,
      entityName: json['entityName'] as String?,
      cardType: json['cardType'] as String?,
      profileId: (json['profileId'] as num?)?.toInt(),
      cardStatus: (json['cardStatus'] as num?)?.toInt(),
      availableBalance: (json['availableBalance'] as num?)?.toInt(),
      createdOn: json['createdOn'] as String?,
      updatedOn: json['updatedOn'] as String?,
      urn: (json['urn'] as num?)?.toInt(),
      statusDescription: json['statusDescription'] as String?,
      transactionProfiles: (json['transactionProfiles'] as List<dynamic>?)
          ?.map((e) => TransactionProfile.fromJson(e as Map<String, dynamic>))
          .toList(),
      subwalletListDetails: (json['subwalletListDetails'] as List<dynamic>?)
          ?.map((e) => Subwallet.fromJson(e as Map<String, dynamic>))
          .toList(),
      uniqueNumberValidity: json['uniqueNumberValidity'] as String?,
      cardLinked: json['cardLinked'] as bool?,
    );

Map<String, dynamic> _$PaymentCardToJson(PaymentCard instance) =>
    <String, dynamic>{
      'cardNumber': instance.cardNumber,
      'lastFourDigit': instance.lastFourDigit,
      'entityName': instance.entityName,
      'cardType': instance.cardType,
      'profileId': instance.profileId,
      'cardStatus': instance.cardStatus,
      'availableBalance': instance.availableBalance,
      'createdOn': instance.createdOn,
      'updatedOn': instance.updatedOn,
      'urn': instance.urn,
      'statusDescription': instance.statusDescription,
      'transactionProfiles':
          instance.transactionProfiles?.map((e) => e.toJson()).toList(),
      'subwalletListDetails':
          instance.subwalletListDetails?.map((e) => e.toJson()).toList(),
      'uniqueNumberValidity': instance.uniqueNumberValidity,
      'cardLinked': instance.cardLinked,
    };

TransactionProfile _$TransactionProfileFromJson(Map<String, dynamic> json) =>
    TransactionProfile(
      transactionProfileId: (json['transactionProfileId'] as num?)?.toInt(),
      status: json['status'] as bool?,
      transactionType: json['transactionType'] as String?,
      transactionRegionName: json['transactionRegionName'] as String?,
    );

Map<String, dynamic> _$TransactionProfileToJson(TransactionProfile instance) =>
    <String, dynamic>{
      'transactionProfileId': instance.transactionProfileId,
      'status': instance.status,
      'transactionType': instance.transactionType,
      'transactionRegionName': instance.transactionRegionName,
    };

Subwallet _$SubwalletFromJson(Map<String, dynamic> json) => Subwallet(
      subwalletId: json['subwallet_id'] as String?,
      defaultWallet: (json['default_wallet'] as num?)?.toInt(),
      availableBalance: json['available_balance'] as String?,
      accountNumber: json['account_number'] as String?,
      accountStatus: json['account_status'] as String?,
      subwalletName: json['subwallet_name'] as String?,
      accountValidity: json['accountValidity'] as String?,
    );

Map<String, dynamic> _$SubwalletToJson(Subwallet instance) => <String, dynamic>{
      'subwallet_id': instance.subwalletId,
      'default_wallet': instance.defaultWallet,
      'available_balance': instance.availableBalance,
      'account_number': instance.accountNumber,
      'account_status': instance.accountStatus,
      'subwallet_name': instance.subwalletName,
      'accountValidity': instance.accountValidity,
    };
