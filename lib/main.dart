
import 'package:antpay_lite/prefrences/session_manager.dart';
import 'package:antpay_lite/prefrences/utility_prefrences.dart';

import 'package:antpay_lite/utils/routes/app_page.dart';
import 'package:antpay_lite/utils/routes/routes_name.dart';
import 'package:antpay_lite/views/account_transfer/account_transfer_beneficial_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
    await UtilityPreferences.initialize();
  await SessionManager.initialize();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyB-udGYUY4Ukn_zKdL42iK3XlvHizdkEaM",
      appId: "1:1043583957614:android:52768691a587723c37047f",
      messagingSenderId: "1043583957614",
      projectId: "antpay-ae6e5",
      storageBucket: "antpay-ae6e5.appspot.com",
    ),
  ).then((value) {
    // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Antpay',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white),
      initialRoute: RoutesName.splash,
      getPages: AppPages.pages,
    // home: AccountTransferBeneficailScreen(),
    );
  }
}
