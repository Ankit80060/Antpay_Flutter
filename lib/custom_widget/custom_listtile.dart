import 'package:antpay_lite/custom_widget/customstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListtileProfile extends StatelessWidget {
  String? title;
  String?icons;
  Function()? onTap;
  
 CustomListtileProfile({super.key,this.title,this.icons,this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 50,
      child: ListTile(contentPadding: EdgeInsets.symmetric(horizontal: 5),
        leading:Image.asset(icons.toString(),scale: 4,),
        title: Text(title.toString(),style: CustomStyles.black13500,),
        onTap: onTap,
      ),
    );
  }
}