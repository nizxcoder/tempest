import 'package:get/get.dart';
import 'package:weather/src/utils/api.dart';
import 'package:weather/src/utils/utils.dart';

class AppController extends GetxController {
  String? latitude;
  String? longitude;
  Map<String, dynamic>? weatherData;

  Future getGeoPositionWeather({bool nav = false}) async {
    if (latitude == null && longitude == null) {
      final value = await getLocationPermission();
      latitude = value['latitude'];
      longitude = value['longitude'];
    }
    
    // get the current location weather
    final res = await ApiCall().getCurrentLocationWeather(
    // set the latitude and longitude, if null set default to New Delhi
      latitude: latitude ?? '28.6',
      longitude: longitude ?? '77.2',
    );
    if (nav) {
      Get.toNamed('/home');
    }
    weatherData = res;
  }
}
