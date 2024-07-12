import 'package:flutter/material.dart';
import 'package:weather/src/utils/constant.dart';

class ForecastDayWidget extends StatefulWidget {
  final bool isSelected;
  final String label;
  final Function()? onTap;
  const ForecastDayWidget({
    super.key,
    this.isSelected = false,
    required this.label,
    this.onTap,
  });

  @override
  State<ForecastDayWidget> createState() => _ForecastDayWidgetState();
}

class _ForecastDayWidgetState extends State<ForecastDayWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0,
      ),
      // color: Colors.blueAccent,
      child: Column(
        children: [
          Text(
            widget.label,
            style: TextStyle(
              fontSize: 18,
              color: widget.isSelected ? Colors.white : AppColors.textColor,
            ),
          ),
          SizedBox(
            height: height * 0.015,
          ),
          Container(
            height: 3.0,
            width: widget.isSelected ? 40.0 : 0.0,
            decoration: BoxDecoration(
              color:
                  widget.isSelected ? AppColors.secondary : Colors.transparent,
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ],
      ),
    );
  }
}
