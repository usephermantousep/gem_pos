import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

class ApiUrl {
  static String baseUrl = 'http://192.168.0.107:8001/api';

  static Map<String, String> defaultHeader = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };
  static Future<Map<String, String>> headerWithToken() async {
    Map<String, String> map = ApiUrl.defaultHeader;
    final existToken = await SharedPreferences.getInstance()
        .then((pref) => pref.getString('token') ?? '');
    map.addAll({'Authorization': existToken});
    return map;
  }
}
