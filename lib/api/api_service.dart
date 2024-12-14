import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:gempos/api/base_api_service.dart';
import 'package:http/http.dart' as http;
import 'package:gempos/global/models.dart';

class ApiService extends BaseApiServices {
  @override
  Future<ApiReturnValue<Map<String, dynamic>?>> get(String url,
      {Map<String, String>? headers, int? duration}) async {
    ApiReturnValue<Map<String, dynamic>?> responseJson;
    try {
      final urlEncoded = Uri.encodeFull(url);
      log('from GET $urlEncoded');
      log('$headers');
      final response = await http
          .get(
            Uri.parse(urlEncoded),
            headers: headers,
          )
          .timeout(Duration(seconds: duration ?? 10));
      responseJson = returnReponse(response);
    } on SocketException {
      return const ApiReturnValue(
          value: null, message: "Komunikasi ke server gagal", statusCode: 503);
    } on TimeoutException {
      return const ApiReturnValue(
          value: null, message: "Komunikasi ke server gagal", statusCode: 408);
    } on http.ClientException catch (e) {
      return ApiReturnValue(value: null, message: "Komunikasi ke server gagal $e", statusCode: 400);
    }
    return responseJson;
  }

  @override
  Future<ApiReturnValue<Map<String, dynamic>?>> post(String url,
      {Map<String, String>? headers, Map<String, dynamic>? body, int? duration}) async {
    ApiReturnValue<Map<String, dynamic>?> responseJson;
    try {
      final urlEncoded = Uri.encodeFull(url);
      log('from POST $urlEncoded');
      log('body => ${body.toString()}');
      final response = await http
          .post(Uri.parse(urlEncoded), body: jsonEncode(body), headers: headers)
          .timeout(Duration(seconds: duration ?? 10));
      responseJson = returnReponse(response);
    } on SocketException {
      return const ApiReturnValue(
          value: null, message: "Error: koneksi ke server gagal", statusCode: 503);
    } on TimeoutException {
      return const ApiReturnValue(
          value: null, message: "Komunikasi ke server gagal", statusCode: 408);
    } on http.ClientException catch (e) {
      return ApiReturnValue(value: null, message: "Komunikasi ke server gagal $e", statusCode: 400);
    } catch (e) {
      return ApiReturnValue(value: null, message: '$e', statusCode: 418);
    }

    return responseJson;
  }

  @override
  Future<ApiReturnValue<Map<String, dynamic>?>> put(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    int? duration,
  }) async {
    ApiReturnValue<Map<String, dynamic>?> responseJson;
    try {
      final urlEncoded = Uri.encodeFull(url);
      log('from PUT $urlEncoded');
      log('$headers');
      final response = await http
          .put(Uri.parse(urlEncoded), body: jsonEncode(body), headers: headers)
          .timeout(const Duration(seconds: 10));
      responseJson = returnReponse(response);
    } on SocketException {
      return const ApiReturnValue(
          value: null, message: "Error: koneksi ke server gagal", statusCode: 503);
    } on TimeoutException {
      return const ApiReturnValue(
          value: null, message: "Komunikasi ke server gagal", statusCode: 408);
    } on http.ClientException catch (e) {
      return ApiReturnValue(value: null, message: "Komunikasi ke server gagal $e", statusCode: 400);
    }

    return responseJson;
  }

  @override
  Future<ApiReturnValue<bool?>> multiPartFile(String url, File file,
      {Map<String, String>? headers, Map<String, dynamic>? body, int? duration}) async {
    try {
      var multiPartFile = await http.MultipartFile.fromPath('file', file.path);
      final client = http.MultipartRequest("POST", Uri.parse(url));
      headers?.forEach((key, value) => client.headers[key] = value);
      body?.forEach((key, value) => client.fields[key] = value);
      client.files.add(multiPartFile);

      final response = await client.send();
      final responsed = await http.Response.fromStream(response);

      log('from PUT $url');
      log(client.headers.toString());

      log(responsed.body);
      if (responsed.statusCode != 200) {
        return ApiReturnValue(
            value: null, message: 'Gagal upload ', statusCode: responsed.statusCode);
      }
      return ApiReturnValue(value: true, statusCode: responsed.statusCode);
    } on SocketException {
      return const ApiReturnValue(
          value: null, message: "Error: koneksi ke server gagal", statusCode: 503);
    } on TimeoutException {
      return const ApiReturnValue(
          value: null, message: "Komunikasi ke server gagal", statusCode: 408);
    } on http.ClientException catch (e) {
      return ApiReturnValue(value: null, message: "Komunikasi ke server gagal $e", statusCode: 400);
    } catch (e) {
      return ApiReturnValue(value: null, message: e.toString(), statusCode: 418);
    }
  }

  @override
  Future<ApiReturnValue<Map<String, dynamic>?>> delete(String url,
      {Map<String, String>? headers, int? duration}) async {
    ApiReturnValue<Map<String, dynamic>?> responseJson;
    try {
      final urlEncoded = Uri.encodeFull(url);
      log('from DELETE $urlEncoded');
      log('$headers');
      final response = await http
          .delete(
            Uri.parse(urlEncoded),
            headers: headers,
          )
          .timeout(Duration(seconds: duration ?? 10));
      responseJson = returnReponse(response);
    } on SocketException {
      return const ApiReturnValue(
          value: null, message: "Error: koneksi ke server gagal", statusCode: 503);
    } on TimeoutException {
      return const ApiReturnValue(
          value: null, message: "Komunikasi ke server gagal", statusCode: 408);
    } on http.ClientException catch (e) {
      return ApiReturnValue(value: null, message: "Komunikasi ke server gagal $e", statusCode: 400);
    }
    return responseJson;
  }

  ApiReturnValue<Map<String, dynamic>?> returnReponse(http.Response response) {
    Map<String, dynamic> json = jsonDecode(response.body);
    log('$json');
    log('${response.statusCode}');
    if (response.statusCode < 200 || response.statusCode > 300) {
      return ApiReturnValue(
          value: null,
          message: json['meta']['message'] ?? 'Terjadi Error',
          statusCode: response.statusCode);
    }
    return ApiReturnValue(value: json, statusCode: response.statusCode);
  }
}
