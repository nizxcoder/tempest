import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:weather/src/utils/utils.dart';

final String apiKey = dotenv.env['WEATHER_API_KEY'] ?? '';

class ApiRoute {
  static const String baseUrl = "http://api.weatherapi.com/v1";
  static const String currentWeather = "/current.json";
  static const String forecastWeather = "/forecast.json";
  static const String search = "/search.json";
  static const String history = "/history.json";
}

Future getReq({required String url}) async {
  if (kDebugMode) {
    print(url);
  }

  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      showToast('Failed to fetch data');
    }
  } catch (e) {
    showToast('Failed to fetch data');
  }
}

// class ApiResponse {
//   final Map response;
//   final int statusCode;

//   ApiResponse({required this.response, required this.statusCode});
// }

class ApiCall {
  Future getCurrentLocationWeather(
      {required String latitude, required String longitude}) async {
    final url =
        '${ApiRoute.baseUrl}${ApiRoute.forecastWeather}?key=$apiKey&q=$latitude,$longitude&aqi=yes';
    return await getReq(url: url);
  }

  Future getSearchLocationWeather({required String location}) async {
    final url =
        '${ApiRoute.baseUrl}${ApiRoute.forecastWeather}?key=$apiKey&q=$location&aqi=yes';
    return await getReq(url: url);
  }
}
