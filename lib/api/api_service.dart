import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:gem_pos/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'base_api_service.dart';

class ApiService extends BaseApiServices {
  @override
  Future<ApiReturnValue<Map<String, dynamic>>> get(String url,
      {Map<String, String>? headers, int? duration}) async {
    dynamic responseJson;
    try {
      final urlEncoded = Uri.encodeFull(url);
      log('from GET $urlEncoded');
      log('$headers');
      final response = await http
          .get(
            Uri.parse(urlEncoded),
            headers: headers,
          )
          .timeout(duration == null
              ? const Duration(seconds: 10)
              : Duration(milliseconds: duration));
      responseJson = returnReponse(response);
    } on SocketException {
      return const ApiReturnValue(
        value: null,
        message: "Komunikasi ke server gagal",
      );
    } on TimeoutException {
      return const ApiReturnValue(
        value: null,
        message: "Komunikasi ke server gagal",
      );
    } on http.ClientException catch (e) {
      return ApiReturnValue(
        value: null,
        message: "Komunikasi ke server gagal $e",
      );
    }
    return responseJson;
  }

  @override
  Future<ApiReturnValue<Map<String, dynamic>>> post(String url,
      {Map<String, String>? headers,
      Map<String, dynamic>? body,
      int? duration}) async {
    dynamic responseJson;
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
        value: null,
        message: "Error: koneksi ke server gagal",
      );
    } on TimeoutException {
      return const ApiReturnValue(
        value: null,
        message: "Komunikasi ke server gagal",
      );
    } on http.ClientException catch (e) {
      return ApiReturnValue(
        value: null,
        message: "Komunikasi ke server gagal $e",
      );
    } catch (e) {
      return ApiReturnValue(
        value: null,
        message: '$e',
      );
    }

    return responseJson;
  }

  @override
  Future<ApiReturnValue<Map<String, dynamic>>> put(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    int? duration,
  }) async {
    dynamic responseJson;
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
        value: null,
        message: "Error: koneksi ke server gagal",
      );
    } on TimeoutException {
      return const ApiReturnValue(
        value: null,
        message: "Komunikasi ke server gagal",
      );
    } on http.ClientException catch (e) {
      return ApiReturnValue(
        value: null,
        message: "Komunikasi ke server gagal $e",
      );
    } catch (e) {
      return ApiReturnValue(
        value: null,
        message: '$e',
      );
    }

    return responseJson;
  }

  @override
  Future<ApiReturnValue<Map<String, dynamic>>> multiPartFile(
      String url, File file,
      {Map<String, String>? headers,
      Map<String, dynamic>? body,
      int? duration}) async {
    try {
      var multiPartFile = await http.MultipartFile.fromPath('file', file.path);
      final client = http.MultipartRequest("POST", Uri.parse(url))
        ..headers["Content-Type"] = "application/json"
        ..headers["Authorization"] = await SharedPreferences.getInstance()
            .then((pref) => pref.getString('ff_token') ?? '')
        ..fields['doctype'] = body?['doctype']
        ..fields['docname'] = body?['docname']
        ..fields['docfield'] = body?['docfield']
        ..files.add(multiPartFile);

      final response = await client.send();
      final responsed = await http.Response.fromStream(response);
      if (responsed.statusCode != 200) {
        return const ApiReturnValue(value: null, message: 'Gagal upload ');
      }

      return ApiReturnValue(
        value: jsonDecode(responsed.body),
      );
    } on SocketException {
      return const ApiReturnValue(
        value: null,
        message: "Error: koneksi ke server gagal",
      );
    } on TimeoutException {
      return const ApiReturnValue(
        value: null,
        message: "Komunikasi ke server gagal",
      );
    } on http.ClientException catch (e) {
      return ApiReturnValue(
        value: null,
        message: "Komunikasi ke server gagal $e",
      );
    } catch (e) {
      return ApiReturnValue(value: null, message: e.toString());
    }
  }

  @override
  Future<ApiReturnValue<Map<String, dynamic>>> delete(String url,
      {Map<String, String>? headers, int? duration}) async {
    dynamic responseJson;
    try {
      final urlEncoded = Uri.encodeFull(url);
      log('from DELETE $urlEncoded');
      log('$headers');
      final response = await http
          .delete(
            Uri.parse(urlEncoded),
            headers: headers,
          )
          .timeout(duration == null
              ? const Duration(seconds: 10)
              : Duration(milliseconds: duration));
      responseJson = returnReponse(response);
    } on SocketException {
      return const ApiReturnValue(
        value: null,
        message: "Error: koneksi ke server gagal",
      );
    } on TimeoutException {
      return const ApiReturnValue(
        value: null,
        message: "Komunikasi ke server gagal",
      );
    } on http.ClientException catch (e) {
      return ApiReturnValue(
        value: null,
        message: "Komunikasi ke server gagal $e",
      );
    }
    return responseJson;
  }

  ApiReturnValue<Map<String, dynamic>> returnReponse(http.Response response) {
    Map<String, dynamic> json = jsonDecode(response.body);
    log('$json');
    log('${response.statusCode}');
    if (response.statusCode != 200) {
      log("${json['meta']['message']}");
      String message = json['meta']['message'] ?? 'Terjadi Error';
      return ApiReturnValue(
        value: null,
        message: message,
      );
    }
    log('berhasil lolos');
    return ApiReturnValue(value: json);
  }
}
