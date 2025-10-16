import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppConstant {
  static const String merchantKey = "DpGYAy";

  static const String environment = "0";
  static const String client_id = "antworkCurlApi";
  static const String secret = "testing@1234#";

  static const String walletIdentifier = "OLW";

  static const String prodSaltKey = "uJCaX2KiybOYo4QEo21y1eT1idmJpYg5";
  static const String showCardSdkUrl =
      "https://payuindia.atlassian.net/wiki/external/NTgyODUwN2Y0ZjMyNDA2N2I0ZTIyOTI1NWE4MjU1Nzg";
  static const int RESULT_CANCELED = 0;
  static const int RESULT_OK = -1;
  static const String disclaimerTextPayu =
      'I hereby confirm that I have voluntarily submitted the copy of my Aadhaar card/e-Aadhaar/masked Aadhaar/Aadhaar XML to PayU Payment Private Limited. I further give my consent to PayU Payments to use my Aadhaar number and/or other information contained in the Aadhaar card (“Aadhaar Information”) to establish my identity for availing banking services. I have no objection for PayU to conduct offline verification of my Aadhaar Information or to share the same with UIDAI for facilitating Aadhaar based authentication and to obtain my demographic information. I have been informed by PayU/AntPay about other alternative options available for me to establish my identity.';
  static String generateAuthParam(String userMobile) {
    String formattedDateTime =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    String combinedData = '$userMobile|$formattedDateTime';
    String param = base64Encode(utf8.encode(combinedData));

    return param;
  }

  static void printLongLog(String text, {int chunkSize = 1000}) {
    for (int i = 0; i < text.length; i += chunkSize) {
      final end = (i + chunkSize < text.length) ? i + chunkSize : text.length;
      debugPrint(text.substring(i, end));
    }
  }

  static String? formatDate(DateTime? dateTime) {
    if (dateTime == null) return null;
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }
}
