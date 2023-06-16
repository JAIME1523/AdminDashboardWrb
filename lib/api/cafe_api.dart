import 'package:admin_dashboard/services/local_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class CafeApi {
  static final Dio _dio = Dio();

  static void configureDio() {
    _dio.options.baseUrl = "http://192.168.0.198:8080/api";
    _dio.options.headers = {
      'x-token': LocalStorage.prefs!.getString('token') ?? '',
    };
  }

  static Future httpGet(String path) async {
    try {
      final resp = await _dio.get(path);
      return resp.data;
    } catch (e) {
      throw ('error en el Get');
    }
  }

  static Future httpPost(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    try {
      final resp = await _dio.post(path, data: formData);
      return resp.data;
    } catch (e) {
      throw ('error en el post');
    }
  }

  static Future httpPut(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    try {
      final resp = await _dio.put(path, data: formData);
      return resp.data;
    } on DioError catch (e) {
      throw ('error en el put $e');
    }
  }

  static Future httpDelete(String path) async {
    try {
      final resp = await _dio.delete(path);
      return resp.data;
    } catch (e) {
      throw ('error en el delete');
    }
  }

  static Future uploadFile(String path, Uint8List bytes) async {
    final formData = FormData.fromMap({
      'archivo': MultipartFile.fromBytes(bytes),
    });
    try {
      final resp = await _dio.put(path, data: formData);
      return resp.data;
    } on DioError catch (e) {
      throw ('error en el put $e');
    }
  }
}
