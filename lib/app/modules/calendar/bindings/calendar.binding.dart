import 'package:my_calender/app/data/repositories/calendar.repository.dart';
import 'package:my_calender/app/modules/calendar/controllers/calendar.controller.dart';
import 'package:get/get.dart';


class CalendarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CalendarController(
      repository: CalendarRepository(),
    ));
  }
}
