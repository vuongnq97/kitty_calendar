import 'package:cr_calendar/cr_calendar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_calender/app/modules/calendar/res/colors.dart';

/// Widget that represents week days in row above calendar month view.
class WeekDaysWidget extends StatelessWidget {
  const WeekDaysWidget({
    required this.day,
    super.key,
  });

  /// [WeekDay] value from [WeekDaysBuilder].
  final WeekDay day;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Center(
        child: Text(
          describeEnum(day).substring(0, 2).toUpperCase(),
          style: TextStyle(
            color: Colors.green.withOpacity(1),
          ),
        ),
      ),
    );
  }
}
