
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class Permissions {

  // var context = context;
  static final Permissions _instance = Permissions._internal();

  factory Permissions() => _instance;

  Permissions._internal();

  Future<bool> checkAndRequestPermissions() async {
    var status = await Permission.phone.status;
    if (status.isGranted) {
      return true;
    } else {
      var result = await Permission.phone.request();
      if (result.isGranted) {
        return true;
      } else {
        return false;
      }
    }
  }

  Future<bool> handleLocationPermissions() async{

    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
    
      return false;
    }
    return true;

  }
}