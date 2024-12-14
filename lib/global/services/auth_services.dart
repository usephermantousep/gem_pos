part of 'package:gempos/global/services.dart';

class AuthService {
  const AuthService(this._apiService);
  final BaseApiServices _apiService;

  Future<ApiReturnValue<String>> login({required LoginModel data}) async {
    final response = await _apiService.post('${F.baseUrl}/api/login',
        headers: ApiUrl.defaultHeader, body: data.toMap());

    if (response.value == null) {
      return ApiReturnValue(
          value: null, message: response.message, statusCode: response.statusCode);
    }
    final res = response.value!['data'];
    final token = "${res['token_type']} ${res['access_token']}";
    log(token);
    return ApiReturnValue(value: token, message: response.message, statusCode: response.statusCode);
  }

  Future<ApiReturnValue<bool?>> logout() async {
    final response = await _apiService.post(
      '${F.baseUrl}/api/logout',
      headers: await ApiUrl.headerWithToken(),
    );

    if (response.value == null) {
      return ApiReturnValue(
          value: null, message: response.message, statusCode: response.statusCode);
    }

    return ApiReturnValue(value: true, message: response.message, statusCode: response.statusCode);
  }

  Future<ApiReturnValue<UserModel>> getUser() async {
    final response = await _apiService.get(
      '${F.baseUrl}/api/user',
      headers: await ApiUrl.headerWithToken(),
    );

    if (response.value == null) {
      return ApiReturnValue(
          value: null, message: response.message, statusCode: response.statusCode);
    }

    return ApiReturnValue(
        value: UserModel.fromMap(response.value!['data']),
        message: response.message,
        statusCode: response.statusCode);
  }
}
