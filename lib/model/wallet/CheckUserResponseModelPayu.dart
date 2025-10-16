import 'package:json_annotation/json_annotation.dart';

part 'CheckUserResponseModelPayu.g.dart';

@JsonSerializable()
class CheckUserResponseModelPayu {
  @JsonKey(name: 'customerId')
  String? customerId;
  @JsonKey(name: 'responseCode')
  String? responseCode;
  @JsonKey(name: 'messageCode')
  int? messageCode;
  @JsonKey(name: 'clientTxnId')
  String? clientTxnId;
  @JsonKey(name: 'clientId')
  String? clientId;
  @JsonKey(name: 'responseDateTime')
  String? responseDateTime;
  @JsonKey(name: 'accosaTransactionId')
  int? accosaTransactionId;
  @JsonKey(name: 'responseMessage')
  String? responseMessage;
  @JsonKey(name: 'bankId')
  int? bankId;
  @JsonKey(name: 'profileId')
  int? profileId;
  @JsonKey(name: 'mobile')
  String? mobile;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'firstName')
  String? firstName;
  @JsonKey(name: 'lastName')
  String? lastName;
  @JsonKey(name: 'dob')
  String? dob;
  @JsonKey(name: 'kycName')
  String? kycName;
  @JsonKey(name: 'riskCategory')
  String? riskCategory;
  @JsonKey(name: 'riskScore')
  int? riskScore;
  @JsonKey(name: 'rekyc')
  bool? rekyc;
  @JsonKey(name: 'rekycValidity')
  String? rekycValidity;
  @JsonKey(name: 'form60')
  bool? form60;
  @JsonKey(name: 'panValid')
  bool? panValid;
  @JsonKey(name: 'form60Validity')
  String? form60Validity;
  @JsonKey(name: 'form60Expiry')
  String? form60Expiry;
  @JsonKey(name: 'docList')
  List<Doc>? docList;
  @JsonKey(name: 'cardList')
  List<PaymentCard>? cardList;
  @JsonKey(name: 'isMpinSet')
  bool? isMpinSet;
  @JsonKey(name: 'mpinExpired')
  bool? mpinExpired;
  @JsonKey(name: 'migratedUserFlag')
  String? migratedUserFlag;

  CheckUserResponseModelPayu({
    this.isMpinSet,
    this.mpinExpired,
    this.migratedUserFlag,
    this.customerId,
    this.responseCode,
    this.messageCode,
    this.clientTxnId,
    this.clientId,
    this.responseDateTime,
    this.accosaTransactionId,
    this.responseMessage,
    this.bankId,
    this.profileId,
    this.mobile,
    this.email,
    this.firstName,
    this.lastName,
    this.dob,
    this.kycName,
    this.riskCategory,
    this.riskScore,
    this.rekyc,
    this.rekycValidity,
    this.form60,
    this.panValid,
    this.form60Validity,
    this.docList,
    this.cardList,
  });

  factory CheckUserResponseModelPayu.fromJson(Map<String, dynamic> json) =>
      _$CheckUserResponseModelPayuFromJson(json);

  Map<String, dynamic> toJson() => _$CheckUserResponseModelPayuToJson(this);
}

@JsonSerializable()
class Doc {
  @JsonKey(name: 'docType')
  String? docType;
  @JsonKey(name: 'docNumber')
  String? docNumber;

  Doc({this.docType, this.docNumber});

  factory Doc.fromJson(Map<String, dynamic> json) => _$DocFromJson(json);

  Map<String, dynamic> toJson() => _$DocToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PaymentCard {
  @JsonKey(name: 'cardNumber')
  String? cardNumber;
  @JsonKey(name: 'lastFourDigit')
  String? lastFourDigit;
  @JsonKey(name: 'entityName')
  String? entityName;
  @JsonKey(name: 'cardType')
  String? cardType;
  @JsonKey(name: 'profileId')
  int? profileId;
  @JsonKey(name: 'cardStatus')
  int? cardStatus;
  @JsonKey(name: 'availableBalance')
  int? availableBalance;
  @JsonKey(name: 'createdOn')
  String? createdOn;
  @JsonKey(name: 'updatedOn')
  String? updatedOn;
  @JsonKey(name: 'urn')
  int? urn;
  @JsonKey(name: 'statusDescription')
  String? statusDescription;
  @JsonKey(name: 'transactionProfiles')
  List<TransactionProfile>? transactionProfiles;
  @JsonKey(name: 'subwalletListDetails')
  List<Subwallet>? subwalletListDetails;
  @JsonKey(name: 'uniqueNumberValidity')
  String? uniqueNumberValidity;
  @JsonKey(name: 'cardLinked')
  bool? cardLinked;

  PaymentCard({
    this.cardNumber,
    this.lastFourDigit,
    this.entityName,
    this.cardType,
    this.profileId,
    this.cardStatus,
    this.availableBalance,
    this.createdOn,
    this.updatedOn,
    this.urn,
    this.statusDescription,
    this.transactionProfiles,
    this.subwalletListDetails,
    this.uniqueNumberValidity,
    this.cardLinked,
  });

  factory PaymentCard.fromJson(Map<String, dynamic> json) =>
      _$PaymentCardFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentCardToJson(this);
}

@JsonSerializable()
class TransactionProfile {
  @JsonKey(name: 'transactionProfileId')
  int? transactionProfileId;
  @JsonKey(name: 'status')
  bool? status;
  @JsonKey(name: 'transactionType')
  String? transactionType;
  @JsonKey(name: 'transactionRegionName')
  String? transactionRegionName;

  TransactionProfile({
    this.transactionProfileId,
    this.status,
    this.transactionType,
    this.transactionRegionName,
  });

  factory TransactionProfile.fromJson(Map<String, dynamic> json) =>
      _$TransactionProfileFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionProfileToJson(this);
}

@JsonSerializable()
class Subwallet {
  @JsonKey(name: 'subwallet_id')
  String? subwalletId;
  @JsonKey(name: 'default_wallet')
  int? defaultWallet;
  @JsonKey(name: 'available_balance')
  String? availableBalance;
  @JsonKey(name: 'account_number')
  String? accountNumber;
  @JsonKey(name: 'account_status')
  String? accountStatus;
  @JsonKey(name: 'subwallet_name')
  String? subwalletName;
  @JsonKey(name: 'accountValidity')
  String? accountValidity;

  Subwallet({
    this.subwalletId,
    this.defaultWallet,
    this.availableBalance,
    this.accountNumber,
    this.accountStatus,
    this.subwalletName,
    this.accountValidity,
  });

  factory Subwallet.fromJson(Map<String, dynamic> json) =>
      _$SubwalletFromJson(json);

  Map<String, dynamic> toJson() => _$SubwalletToJson(this);
}
