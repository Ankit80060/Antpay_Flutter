class InvestmentDetailsRequestModel {
  final String investmentNo;
  final String mobile;

  InvestmentDetailsRequestModel({
    required this.investmentNo,
    required this.mobile,
  });

  Map<String, dynamic> toJson() {
    return {
      'investment_no': investmentNo,
      'mobile': mobile,
    };
  }


}
class InvestmentDetailsResponseModel {
  final String status;
  final String? invNo;
  final List<InvestmentDetailsData> data;

  InvestmentDetailsResponseModel({
    required this.status,
    this.invNo,
    required this.data,
  });

  factory InvestmentDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    return InvestmentDetailsResponseModel(
      status: json['status'] ?? '0',
      invNo: json['inv_no'],
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => InvestmentDetailsData.fromJson(e))
          .toList() ??
          [],
    );
  }
}

class InvestmentDetailsData {
  final int? sr;
  final String? date;
  final String? particular;
  final String? receipt;
  final String? payment;

  InvestmentDetailsData({
    this.sr,
    this.date,
    this.particular,
    this.receipt,
    this.payment,
  });

  factory InvestmentDetailsData.fromJson(Map<String, dynamic> json) {
    return InvestmentDetailsData(
      sr: json['sr'],
      date: json['Date'],
      particular: json['Particular'],
      receipt: json['Receipt']?.toString(),
      payment: json['Payment']?.toString(),
    );
  }
}
