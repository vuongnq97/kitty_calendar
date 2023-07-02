import 'package:my_calender/app/data/models/response.model.dart';
import 'package:my_calender/app/data/models/user.model.dart';
import 'package:my_calender/app/data/repositories/home.repository.dart';
import 'package:my_calender/app/enums/enums.dart';
import 'package:my_calender/app/utils/message_dialog.dart';
import 'package:my_calender/generated/locales.g.dart';

import 'package:get/get.dart';

class HomeController extends GetxController {
  final HomeRepository repository;

  static HomeController get to => Get.find();

  HomeController({required this.repository});

  RxList<UserModel> _users = RxList<UserModel>();

  List<UserModel> get users => _users;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  Future<void> getUser() async {
    try {
      await repository.getUsers().then(
        (response) {
          if (response.statusCode == APIStatus.Successfully) {
            var fakeResult = {
              "data": response.body,
              "totalCount": 11,
            };
            DataResultModel dataResultModel = DataResultModel.fromJson(fakeResult);

            List<UserModel> result = dataResultModel.data.map<UserModel>((item) => new UserModel.fromJson(item)).toList();
            _users.addAll(result);
          }
          isLoading.value = false;
          update();
        },
      );
    } catch (e) {
      isLoading.value = false;
      update();
      MessageDialog.showError(message: LocaleKeys.Shared_ErrorMessage.tr);
      throw e;
    }
  }

  @override
  void onReady() async {
    super.onReady();
  }
}
