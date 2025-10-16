
import 'package:antpay_lite/viewmodels/notificationcontroller/notification_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    
       Get.lazyPut<NotificationController>(() => NotificationController());
       
       
       
       
    
  }
} 