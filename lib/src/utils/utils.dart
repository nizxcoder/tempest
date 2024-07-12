import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey[800],
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

Future<Map<String, String?>> getLocationPermission() async {
  
  var status = await Permission.location.status;
  if (!status.isGranted || status.isPermanentlyDenied) {
    var permission = await Permission.location.request();
    if (permission.isGranted) {
      showToast('Location permission granted');
    } else if (permission.isPermanentlyDenied) {
      showToast('Location permission is permanently denied');
    } else {
      showToast('Location permission is required');
    }
  }

  try {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    return {
      'latitude': position.latitude.toString(),
      'longitude': position.longitude.toString()
    };
  } catch (e) {
    if (kDebugMode) {
      showToast('Failed to get location: $e');
    }
    return {};
  }
}
