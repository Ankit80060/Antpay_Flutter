
import 'package:antpay_lite/res/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../custom_widget/custom_appbar.dart';
import '../../utils/common_utils.dart';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../custom_widget/custom_appbar.dart';
// import '../../utils/common_utils.dart';


class MainScaffold extends StatelessWidget {
  final Widget body;
  final int selectedIndex;
  final bool? isShowAppBar;
  final bool? resizeToAvoidBottomInset;

  const MainScaffold({
    super.key,
    required this.body,
    this.selectedIndex = 0,
    this.isShowAppBar,
    this.resizeToAvoidBottomInset = true,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      backgroundColor: ColorPalette.baseBackgroundColor,
      appBar:
          CustomAppbar(showBackIcon: (isShowAppBar == false) ? false : true),
      body: body,
      bottomNavigationBar: CommonUtils.customBottomNavigationBar(
        selectedIndex: selectedIndex,
        onTap: (index) {
          switch (index) {
            case 0:
              Get.offAllNamed('/dashboard');
              break;
            case 1:
              Get.offAllNamed('/profile');

              break;
            case 2:
              Get.offAllNamed('/history');

              break;
            case 3:
              Get.offAllNamed('/social');

              break;
          }
        },
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: CustomAppbar(showBackIcon: true),
//       body: body,
//       bottomNavigationBar: CommonUtils.customBottomNavigationBar(
//         selectedIndex: selectedIndex,
//         onTap: (index) {
//           switch (index) {
//             case 0:
//               Get.offAllNamed('/dashboard');
//               break;
//             case 1:
//               Get.offAllNamed('/history');
//               break;
//             case 2:
//               Get.offAllNamed('/social');
//               break;
//             case 3:
//               Get.offAllNamed('/profile');
//               break;
//           }
//         },
//       ),
//     );
//   }
// }

