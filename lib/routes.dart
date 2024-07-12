import 'package:get/get.dart';
import 'package:weather/src/pages/HomePage.page.dart';
import 'package:weather/src/pages/SplashScreen.page.dart';

class RouteName {
  static const splash = '/';
  static const home = '/home';
}

List<GetPage<dynamic>> appRoutes = [
  GetPage(
    name: RouteName.splash,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: RouteName.home,
    page: () => const HomePage(),
  ),
];
