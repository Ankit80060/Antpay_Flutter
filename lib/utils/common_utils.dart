
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:another_flushbar/flushbar.dart';

class CommonUtils {
static showToast(String? message) {
    Fluttertoast.showToast(
        msg: message!,
        //add futher toast properties below:
        backgroundColor: Colors.grey,
        textColor: Colors.black,
        toastLength: Toast.LENGTH_LONG);
}

  static showSnackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  static String convertAmountToRupees(String? paise) {
    if (paise == null || paise.isEmpty) {
      return '0.00';
    }

    try {
      int paiseValue = int.parse(paise);

      double rupees = paiseValue / 100.0;

      return rupees.toStringAsFixed(2);
    } catch (e) {
      return '0.00';
    }
  }


  static  printLongLog(String text, {int chunkSize = 1000}) {
    for (int i = 0; i < text.length; i += chunkSize) {
      final end = (i + chunkSize < text.length) ? i + chunkSize : text.length;
      debugPrint(text.substring(i, end));
    }
  }

  static toColor(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  static fieldFocusChanged(
      BuildContext context, FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static void openPolicyView(BuildContext context, String url) {
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => PolicyWebView(url)));
  }

  static void showFlushBar(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: const EdgeInsets.all(2),
          reverseAnimationCurve: Curves.easeInOut,
          message: message,
          backgroundColor: Colors.red,
          title: 'ERROR',
          messageColor: Colors.black,
          duration: const Duration(seconds: 3),
          // icon: Icon(Icon.error),
        )..show(context));
  }
  static bool isValidMobile(String phone) {
    // Check if phone contains only numbers and has a length of 10
    final bool hasOnlyDigits = RegExp(r'^\d+$').hasMatch(phone);
    return hasOnlyDigits && phone.length == 10;
  }


  static bool isValidMail(String email) {
    // Regular expression for validating email
    final String emailRegex = r'^[_A-Za-z0-9-+]+(\.[_A-Za-z0-9-]+)*@'
        r'[A-Za-z0-9-]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,})$';
    final RegExp regex = RegExp(emailRegex);
    return regex.hasMatch(email);
  }

  static Widget customBottomNavigationBar({
    required int selectedIndex,
    required Function(int) onTap,
  }) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onTap,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xff09466d),
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/images/home.png')),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/images/profile.png')),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/images/history.png')),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/sidebar/social-s.png')),
          label: 'Social',
        ),
        
      ],
    );
  }
}
