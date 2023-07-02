import 'package:dio/dio.dart';
import 'package:my_calender/app/data/mock/user.mock.dart';
import 'package:my_calender/app/settings/endpoints.dart';
import 'package:my_calender/app/utils/http_utils.dart';

class HomeRepository {
  Future<HttpResponse> getUsers() async {
     return await HttpHelper.get(Endpoints.USERS);
    return HttpResponse(
      body: UserMock.getUsers2(),
      headers: Headers(),
      request: RequestOptions(path: ''),
      statusMessage: "Success",
      statusCode: 200,
    );
  }
}
