import 'package:gempos/core/util/util.dart';
import 'package:gempos/flavors.dart';

class ApiUrl {
  static String baseUrl = F.baseUrl;
  static Map<String, String> defaultHeader = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };
  static Future<Map<String, String>> headerWithToken() async {
    Map<String, String> map = ApiUrl.defaultHeader;
    final existToken = await SharedPreferencesUtil.getString(key: SharedPreferencesKey.token) ?? '';
    map.addAll({'Authorization': existToken});
    return map;
  }
}
