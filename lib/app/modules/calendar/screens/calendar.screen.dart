import 'dart:core';

import 'package:cr_calendar/cr_calendar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:my_calender/app/modules/calendar/controllers/calendar.controller.dart';
import 'package:my_calender/app/modules/calendar/res/colors.dart';
import 'package:my_calender/app/modules/calendar/utils/constants.dart';
import 'package:my_calender/app/modules/calendar/widgets/create_event_dialog.dart';
import 'package:my_calender/app/modules/calendar/widgets/day_events_bottom_sheet.dart';
import 'package:my_calender/app/modules/calendar/widgets/day_item_widget.dart';
import 'package:my_calender/app/modules/calendar/widgets/event_widget.dart';
import 'package:my_calender/app/modules/calendar/widgets/week_days_widget.dart';
import 'package:my_calender/app/theme/theme.dart';

/// Main calendar page.
class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarController controller = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/app_bar_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.deepPurpleAccent,
          shadowColor: Colors.deepPurpleAccent,
          centerTitle: false,
          title: Obx(() => Container(
                decoration: BoxDecoration(
                    color: ColorStyle1.c19D376.withOpacity(0.7),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    )),
                padding: EdgeInsets.all(5),
                child: Text(
                  controller.appbarTitleNotifier.value,
                  style: TextStyle(color: Colors.black),
                ),
              )),
          actions: [
            Container(
              decoration: BoxDecoration(
                color: ColorStyle1.c19D376.withOpacity(0.7),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              margin: EdgeInsets.only(right: 16),
              child: IconButton(
                tooltip: 'Go to current date',
                icon: const Icon(
                  Icons.calendar_today,
                  color: Colors.black,
                ),
                onPressed: controller.showCurrentMonth,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: controller.addEvent,
          child: Padding(
            padding: EdgeInsets.only(bottom: 100),
            child: const Icon(Icons.add),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/app_bg.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            children: [
              /// Calendar control row.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      controller.changeCalendarPage(showNext: false);
                    },
                  ),
                  Obx(() => Text(
                        controller.monthNameNotifier.value,
                        style: TextStyle(fontSize: 22, color: ColorStyle1.c19D376, fontWeight: FontWeight.w500),
                      )),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      controller.changeCalendarPage(showNext: true);
                    },
                  ),
                ],
              ),

              /// Calendar view.
              Expanded(
                child: Obx(
                  () => controller.isLoading.value
                      ? SizedBox()
                      : CrCalendar(
                          firstDayOfWeek: WeekDay.monday,
                          eventsTopPadding: 25,
                          initialDate: controller.currentDate,
                          maxEventLines: 5,
                          controller: controller.calendarController,
                          forceSixWeek: true,
                          dayItemBuilder: (builderArgument) => DayItemWidget(properties: builderArgument),
                          weekDaysBuilder: (day) => WeekDaysWidget(day: day),
                          eventBuilder: (drawer) => EventWidget(drawer: drawer),
                          onDayClicked: _showDayEventsInModalSheet,
                          minDate: DateTime.now().subtract(const Duration(days: 1000)),
                          maxDate: DateTime.now().add(const Duration(days: 180)),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Show [CreateEventDialog] with settings for new event.

  void _showDayEventsInModalSheet(List<CalendarEventModel> events, DateTime day) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) => DayEventsBottomSheet(
        events: events,
        day: day,
        screenHeight: MediaQuery.of(context).size.height,
      ),
    );
  }
}
