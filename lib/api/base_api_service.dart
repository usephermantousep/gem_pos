import 'dart:io';

import 'package:gem_pos/models/models.dart';

abstract class BaseApiServices {
  Future<ApiReturnValue<Map<String, dynamic>>> get(String url,
      {Map<String, String>? headers, int? duration});
  Future<ApiReturnValue<Map<String, dynamic>>> post(String url,
      {Map<String, String>? headers,
      Map<String, dynamic>? body,
      int? duration});
  Future<ApiReturnValue<Map<String, dynamic>>> multiPartFile(
      String url, File file,
      {Map<String, String>? headers,
      Map<String, dynamic>? body,
      int? duration});
  Future<ApiReturnValue<Map<String, dynamic>>> put(String url,
      {Map<String, String>? headers,
      Map<String, dynamic>? body,
      int? duration});
  Future<ApiReturnValue<Map<String, dynamic>>> delete(String url,
      {Map<String, String>? headers, int? duration});
}
