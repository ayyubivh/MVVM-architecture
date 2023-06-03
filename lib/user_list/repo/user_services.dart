import 'dart:io';

import 'package:mvvm_sample/user_list/models/model.dart';
import 'package:mvvm_sample/user_list/repo/api_status.dart';
import 'package:mvvm_sample/utils/contstants.dart';
import 'package:http/http.dart' as http;

class UserServices {
  static Future<Object> getUsers() async {
    try {
      var response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
      if (SUCCESS == response.statusCode) {
        return Success(response: userListModelFromJson(response.body));
      }
      return Failure(
          code: USER_INVALID_RESPONSE, erroResponse: 'Invalid Response');
    } on HttpException {
      return Failure(
          code: NO_INTERNET, erroResponse: 'No Internet          Connection');
    } on SocketException {
      return Failure(code: NO_INTERNET, erroResponse: 'No Internet Connection');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, erroResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, erroResponse: 'Unknown Error');
    }
  }
}
