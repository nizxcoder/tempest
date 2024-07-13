import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather/src/controller.dart';
import 'package:weather/src/utils/api.dart';
import 'package:weather/src/utils/constant.dart';
import 'package:weather/src/utils/utils.dart';
import 'package:weather/src/widgets/forecastcard.dart';
import 'package:weather/src/widgets/forecastday.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AppController appController = Get.find<AppController>();
  var locationStatus = PermissionStatus.denied;
  TextEditingController searchController = TextEditingController();
  FocusNode searchNode = FocusNode();
  bool loading = false;
  bool isSearching = false;
  DateTime? lastBackPressed;

  // API Data
  ApiCall api = ApiCall();
  Map<String, dynamic> locationData = {};
  Map<String, dynamic> currentTempData = {};
  Map<String, dynamic> forecastData = {};
  List<Map<String, dynamic>> forcecastDayData = [];

  void getLocationStatus() async {
    var status = await Permission.location.status;
    setState(() {
      locationStatus = status;
    });
  }

  void accessLocation() async {
    setState(() {
      loading = true;
    });
    var permission = await Permission.location.request();
    if (permission.isDenied) {
      return;
    }
    await appController.getGeoPositionWeather();
    setLocationAndTempData();
  }

  void setLocationAndTempData() async {
    setState(() {
      locationData = appController.weatherData?['location'] ?? {};
      currentTempData = appController.weatherData?['current'] ?? {};
      forecastData = appController.weatherData?['forecast'] ?? {};
      loading = false;
    });
  }

  Future<void> refreshData() async {
    setState(() {
      loading = true;
    });
    await appController.getGeoPositionWeather();
    setLocationAndTempData();
  }

  void handleSearchField() {
    setState(() {
      isSearching = !isSearching;
    });
    searchNode.requestFocus();
  }

  void handleSearch(String location) async {
    setState(() {
      loading = true;
      isSearching = false;
    });
    final res = await api.getSearchLocationWeather(location: location);
    appController.weatherData = res;

    setLocationAndTempData();
    setState(() {
      loading = false;
    });
    searchController.clear();
  }

  @override
  void initState() {
    super.initState();
    // get the location status
    getLocationStatus();
    // set the location and temp data
    setLocationAndTempData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.transparent),
      child: PopScope(
        canPop: false,
        onPopInvoked: (_) {
          if (lastBackPressed == null ||
              DateTime.now().difference(lastBackPressed!) >
                  const Duration(seconds: 3)) {
            setState(() {
              lastBackPressed = DateTime.now();
            });
            showToast("Back Again To Exit!");
            return;
          }
          SystemNavigator.pop(animated: true);
        },
        child: Scaffold(
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: isSearching
                  ? TextField(
                      controller: searchController,
                      focusNode: searchNode,
                      decoration: const InputDecoration(
                        hintText: 'Search location',
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(color: Colors.white),
                      onSubmitted: (value) => handleSearch(value),
                    )
                  : loading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator.adaptive(
                            strokeWidth: 2,
                            backgroundColor: Colors.white,
                            valueColor:
                                AlwaysStoppedAnimation(AppColors.secondary),
                          ),
                        )
                      : Text(
                          '${locationData['name'] ?? "Delhi"}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.1,
                          ),
                        ),
            ),
            leading: IconButton(
              icon: Icon(
                locationStatus.isDenied
                    ? Icons.location_off_sharp
                    : Icons.location_on_sharp,
                color: AppColors.textColor,
              ),
              onPressed: accessLocation,
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.search,
                  color: AppColors.textColor,
                ),
                onPressed: () => handleSearchField(),
              ),
            ],
          ),
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.bgStart,
                      AppColors.bgMiddle,
                      AppColors.bgEnd,
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.105,
                    ),
                    SvgPicture.string(
                      AppSvg.sunIcon,
                      height: 65.0,
                    ),
                    // Image.network( //TODO: Change the image
                    //   'https:${currentTempData['condition']['icon'] ?? "//cdn.weatherapi.com/weather/64x64/night/113.png"}',
                    //   height: 65.0,
                    // ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    Text(
                      currentTempData['condition']?['text'] ?? "Clear",
                      style: const TextStyle(
                        color: AppColors.textColor,
                        letterSpacing: 1.5,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${currentTempData['temp_c']?.floor() ?? 27}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 120.0,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        const Text(
                          '°C',
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.0425,
                    ),
                    Text(
                      '${locationData['region'] ?? "New Delhi"}, ${locationData['country'] ?? "India"}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.0225,
                    ),
                    SizedBox(
                      width: width * 0.55,
                      child: Row(
                        children: [
                          Text(
                            'Feels like ${currentTempData['feelslike_c'] ?? "25"}°C',
                            style: const TextStyle(
                              color: AppColors.textColor,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            currentTempData['is_day'] == 1
                                ? "Sunset ${appController.weatherData?['forecast']?['forecastday']?[0]?['astro']?['sunset'] ?? "06:35 PM"}"
                                : "Sunrise ${appController.weatherData?['forecast']?['forecastday']?[0]?['astro']?['sunrise'] ?? "05:35 AM"}",
                            style: const TextStyle(
                              color: AppColors.textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.0725,
                    ),
                    SizedBox(
                      width: width * 0.8,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ForecastDayWidget(
                            label: "Today",
                            isSelected: true,
                          ),
                          ForecastDayWidget(
                            label: "Tommorow",
                          ),
                          ForecastDayWidget(
                            label: "7 Days",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.0425,
                    ),
                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        child: Row(
                          children: [
                            SizedBox(width: 50),
                            ForecastCardWidget(icon: AppSvg.sunIcon),
                            ForecastCardWidget(
                              icon: AppSvg.sunIcon,
                              isActive: true,
                            ),
                            ForecastCardWidget(icon: AppSvg.sunIcon),
                            ForecastCardWidget(icon: AppSvg.cloudIcon),
                            ForecastCardWidget(icon: AppSvg.cloudIcon),
                            ForecastCardWidget(icon: AppSvg.sunIcon),
                            ForecastCardWidget(icon: AppSvg.sunIcon),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.0425,
                    ),
                    SizedBox(
                      width: width * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Wind ${currentTempData['wind_kph'] ?? "5"} km/h',
                            style: const TextStyle(
                              color: AppColors.textColor,
                            ),
                          ),
                          const Text(
                            '|',
                            style: TextStyle(
                              color: AppColors.textColor,
                            ),
                          ),
                          Text(
                            'Humidity ${currentTempData['humidity'] ?? '60'}%',
                            style: const TextStyle(
                              color: AppColors.textColor,
                            ),
                          ),
                          const Text(
                            '|',
                            style: TextStyle(
                              color: AppColors.textColor,
                            ),
                          ),
                          Text(
                            'Air Quality ${currentTempData['air_quality']?['pm2_5'] ?? 42}',
                            style: const TextStyle(
                              color: AppColors.textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (isSearching)
                Container(
                  color: Colors.black.withOpacity(0.5),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isSearching = false;
                        });
                      },
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
