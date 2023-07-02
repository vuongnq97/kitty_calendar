import 'package:cr_calendar/cr_calendar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class DefaultWeekdayWidget extends StatelessWidget {
  const DefaultWeekdayWidget({
    required this.day,
    super.key,
  });

  final WeekDay day;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Center(
        child: Text(
          describeEnum(day).substring(0, 1).toUpperCase(),
        ),
      ),
    );
  }
}
