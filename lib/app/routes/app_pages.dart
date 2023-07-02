import 'package:my_calender/app/modules/home/bindings/home.binding.dart';
import 'package:my_calender/app/modules/home/screens/home.screen.dart';

import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    /*bindings: [
        UserBinding(),
      ],*/
  ];
}
