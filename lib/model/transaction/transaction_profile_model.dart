import 'package:json_annotation/json_annotation.dart';

part 'transaction_profile_model.g.dart';

@JsonSerializable()
class TransactionProfileRequestModel {
  final int enablementType;
  final List<TransactionProfile> transactionProfile;
  final String urn;
  final String aParam;

  TransactionProfileRequestModel({
    required this.enablementType,
    required this.transactionProfile,
    required this.urn,
    required this.aParam,
  });

  factory TransactionProfileRequestModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionProfileRequestModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TransactionProfileRequestModelToJson(this);
}

@JsonSerializable()
class TransactionProfile {
  final String status;
  final String transactionProfileId;
  final String transactionType;

  TransactionProfile({
    required this.status,
    required this.transactionProfileId,
    required this.transactionType,
  });

  factory TransactionProfile.fromJson(Map<String, dynamic> json) =>
      _$TransactionProfileFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionProfileToJson(this);
}

// Response 
@JsonSerializable()
class TransactionStatusResponseModel {
  final int urn;
  final String description;
  final String responseCode;
  final int messageCode;
  final String clientTxnId;
  final String clientId;
  final String responseDateTime;
  final int accosaTransactionId;
  final int bankId;
  final List<TransactionProfileRes> transactionProfile;

  TransactionStatusResponseModel({
    required this.urn,
    required this.description,
    required this.responseCode,
    required this.messageCode,
    required this.clientTxnId,
    required this.clientId,
    required this.responseDateTime,
    required this.accosaTransactionId,
    required this.bankId,
    required this.transactionProfile,
  });

  factory TransactionStatusResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionStatusResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TransactionStatusResponseModelToJson(this);
}

@JsonSerializable()
class TransactionProfileRes {
  final int transactionProfileId;
  final bool status;
  final String updateFlag;
  final String transactionType;

  TransactionProfileRes({
    required this.transactionProfileId,
    required this.status,
    required this.updateFlag,
    required this.transactionType,
  });

  factory TransactionProfileRes.fromJson(Map<String, dynamic> json) =>
      _$TransactionProfileResFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionProfileResToJson(this);
}
