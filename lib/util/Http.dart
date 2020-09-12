import 'package:dio/dio.dart';
import 'package:mobile_developer_skill_testing/constant/api.dart';

class HttpUtil {
  static Dio http() {
    Dio dio = new Dio();
    dio.options.baseUrl = ApiConstant.BASE_URL;
    return dio;
  }
}