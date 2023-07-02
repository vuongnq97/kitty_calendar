import 'package:cr_calendar/cr_calendar.dart';
import 'package:intl/intl.dart';
import 'package:my_calender/app/data/repositories/calendar.repository.dart';

import 'package:get/get.dart';
import 'package:my_calender/app/modules/calendar/res/colors.dart';
import 'package:my_calender/app/modules/calendar/utils/constants.dart';
import 'package:my_calender/app/modules/calendar/widgets/create_event_dialog.dart';
import 'package:my_calender/app/theme/theme.dart';

class CalendarController extends GetxController {
  final CalendarRepository repository;

  static CalendarController get to => Get.find();

  CalendarController({required this.repository});

  var calendarController;
  RxBool isLoading = true.obs;
  DateTime currentDate = DateTime.now();
  RxString appbarTitleNotifier = RxString('');
  RxString monthNameNotifier = RxString('');

  @override
  void onReady() async {
    C.abc();
    setTexts(currentDate.year, currentDate.month);
    createExampleEvents();
    super.onReady();
  }

  void setTexts(int year, int month) {
    final date = DateTime(year, month);
    appbarTitleNotifier.value = DateFormat(Constants.kAppBarDateFormat).format(date);
    monthNameNotifier.value = DateFormat(Constants.kMonthFormat).format(date);
  }

  void showCurrentMonth() {
    calendarController.goToDate(currentDate);
  }

  void changeCalendarPage({required bool showNext}) => showNext ? calendarController.swipeToNextMonth() : calendarController.swipeToPreviousPage();

  void onCalendarPageChanged(int year, int month) {
    setTexts(year, month);
  }

  Future<void> addEvent() async {
    final event = await Get.dialog(CreateEventDialog());
    if (event != null) {
      calendarController.addEvent(event);
    }
  }

  void createExampleEvents() {
    final now = currentDate;
    calendarController = CrCalendarController(
      onSwipe: onCalendarPageChanged,
      events: [
        CalendarEventModel(
          name: '1 event',
          begin: DateTime(now.year, now.month, (now.day).clamp(1, 28)),
          end: DateTime(now.year, now.month, (now.day).clamp(1, 28)),
          eventColor: eventColors[0],
        ),
        CalendarEventModel(
          name: '2 event',
          begin: DateTime(now.year, now.month - 1, (now.day - 2).clamp(1, 28)),
          end: DateTime(now.year, now.month, (now.day + 2).clamp(1, 28)),
          eventColor: eventColors[1],
        ),
        CalendarEventModel(
          name: '3 event',
          begin: DateTime(now.year, now.month, (now.day - 3).clamp(1, 28)),
          end: DateTime(now.year, now.month + 1, (now.day + 4).clamp(1, 28)),
          eventColor: eventColors[2],
        ),
        CalendarEventModel(
          name: '4 event',
          begin: DateTime(now.year, now.month - 1, (now.day).clamp(1, 28)),
          end: DateTime(now.year, now.month + 1, (now.day + 5).clamp(1, 28)),
          eventColor: eventColors[3],
        ),
        CalendarEventModel(
          name: '5 event',
          begin: DateTime(now.year, now.month + 1, (now.day + 1).clamp(1, 28)),
          end: DateTime(now.year, now.month + 2, (now.day + 7).clamp(1, 28)),
          eventColor: eventColors[4],
        ),
      ],
    );
    isLoading.value = false;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
