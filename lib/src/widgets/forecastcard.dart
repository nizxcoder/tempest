import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/src/utils/constant.dart';

class ForecastCardWidget extends StatefulWidget {
  final bool isActive;
  final String icon;
  const ForecastCardWidget(
      {super.key, this.isActive = false, required this.icon});

  @override
  State<ForecastCardWidget> createState() => _ForecastCardWidgetState();
}

class _ForecastCardWidgetState extends State<ForecastCardWidget> {
  @override
  Widget build(BuildContext context) {
    bool isActive = widget.isActive;
    String svgIcon = widget.icon;
    return Container(
      height: isActive ? 160 : 140.0,
      width: 80.0,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.symmetric(
        vertical: 12.0,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isActive
              ? [
                  const Color.fromRGBO(226, 85, 19, 1),
                  const Color.fromRGBO(254, 123, 61, 1),
                  const Color.fromRGBO(226, 85, 19, 1),
                ]
              : [
                  const Color.fromRGBO(57, 62, 66, 1),
                  const Color.fromRGBO(58, 62, 67, 1),
                  const Color.fromRGBO(46, 49, 54, 1),
                ],
        ),
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '9 AM',
            style: TextStyle(
              color: isActive ? Colors.white : AppColors.textColor,
            ),
          ),
          SvgPicture.string(
            svgIcon,
            height: 35.0,
          ),
          const Text(
            '27°C',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
