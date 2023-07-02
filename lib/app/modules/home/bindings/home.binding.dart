import 'package:my_calender/app/data/repositories/calendar.repository.dart';
import 'package:my_calender/app/data/repositories/home.repository.dart';
import 'package:my_calender/app/modules/calendar/controllers/calendar.controller.dart';
import 'package:my_calender/app/modules/home/controllers/home.controller.dart';

import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(
      repository: HomeRepository(),
    ));
    Get.put(CalendarController(
      repository: CalendarRepository(),
    ));
  }
}
