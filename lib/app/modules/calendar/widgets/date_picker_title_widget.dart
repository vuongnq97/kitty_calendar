import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_calender/app/modules/calendar/res/colors.dart';
import 'package:my_calender/app/modules/calendar/utils/constants.dart';

class DatePickerTitle extends StatelessWidget {
  const DatePickerTitle({
    required this.date,
    super.key,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      alignment: Alignment.centerLeft,
      child: Text(
        DateFormat(Constants.kMonthFormatWidthYear).format(date),
        style: const TextStyle(
          fontSize: 21,
          color: violet,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
