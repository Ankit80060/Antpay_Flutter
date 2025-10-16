import 'package:json_annotation/json_annotation.dart';
part 'ppi_kyc_reg_user_request_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PpiRegisterUserRequest {
  String? aParam;
  String? customerId;
  String? messageCode;
  String? clientTxnId;
  String? requestDateTime;
  CustomerDetails? customerDetails;
  String? sorCustomerId;
  AddressDetails? addressDetails;
  List<DocList>? docList;
  String? kycProfile;
  String? riskCategory;
  String? riskScore;
  bool? form60;
  String? productId;
  bool? formFactorRequired;
  int? initialLoad;
  String? initialLoadAmtCurrency;
  String? reserveField1;
  String? reserveField2;
  String? walletActiveDeviceID;

  PpiRegisterUserRequest({
    this.aParam,
    this.customerId,
    this.messageCode,
    this.clientTxnId,
    this.requestDateTime,
    this.customerDetails,
    this.sorCustomerId,
    this.addressDetails,
    this.docList,
    this.kycProfile,
    this.riskCategory,
    this.riskScore,
    this.form60,
    this.productId,
    this.formFactorRequired,
    this.initialLoad,
    this.initialLoadAmtCurrency,
    this.reserveField1,
    this.reserveField2,
    this.walletActiveDeviceID
  });

  factory PpiRegisterUserRequest.fromJson(Map<String, dynamic> json) =>
      _$PpiRegisterUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PpiRegisterUserRequestToJson(this);
}

@JsonSerializable()
class CustomerDetails {
  String? firstName;
  String? middleName;
  String? lastName;
  String? gender;
  String? dateOfBirth;
  String? mobileNumber;
  String? emailAddress;

  CustomerDetails({
    this.firstName,
    this.middleName,
    this.lastName,
    this.gender,
    this.dateOfBirth,
    this.mobileNumber,
    this.emailAddress,
  });

  factory CustomerDetails.fromJson(Map<String, dynamic> json) =>
      _$CustomerDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerDetailsToJson(this);
}

@JsonSerializable()
class AddressDetails {
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? country;
  String? zipCode;

  AddressDetails({
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.country,
    this.zipCode,
  });

  factory AddressDetails.fromJson(Map<String, dynamic> json) =>
      _$AddressDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AddressDetailsToJson(this);
}

@JsonSerializable()
class DocList {
  String? ovdType;
  String? ovdNo;

  DocList({
    this.ovdType,
    this.ovdNo,
  });

  factory DocList.fromJson(Map<String, dynamic> json) =>
      _$DocListFromJson(json);

  Map<String, dynamic> toJson() => _$DocListToJson(this);
}
