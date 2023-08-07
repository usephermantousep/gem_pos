import 'package:gem_pos/api/api_url.dart';
import 'package:gem_pos/api/base_api_service.dart';
import 'package:gem_pos/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  const AuthService(this._apiServices);

  final BaseApiServices _apiServices;

  Future<ApiReturnValue<UserModel?>> login(LoginDto loginDto) async {
    final response = await _apiServices.post('${ApiUrl.baseUrl}/login',
        headers: ApiUrl.defaultHeader, body: loginDto.toJson());

    if (response.value == null) {
      return ApiReturnValue(value: null, message: response.message);
    }

    final pref = await SharedPreferences.getInstance();
    pref.setString('token',
        '${response.value?['data']['token_type']} ${response.value?['data']['access_token']}');

    final user = UserModel.fromJson(response.value?['data']['user']);

    return ApiReturnValue(value: user, message: response.message);
  }

  Future<ApiReturnValue<UserModel?>> fetchUser() async {
    try {
      final response = await _apiServices.get('${ApiUrl.baseUrl}/user',
          headers: await ApiUrl.headerWithToken());

      if (response.value == null) {
        return ApiReturnValue(value: null, message: response.message);
      }

      final user = UserModel.fromJson(response.value?['data']);

      return ApiReturnValue(
          value: user, message: 'Selamat Datang ${user.name.toUpperCase()}');
    } catch (e) {
      return ApiReturnValue(value: null, message: e.toString());
    }
  }
}
