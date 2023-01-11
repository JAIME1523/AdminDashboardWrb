import 'package:admin_dashboard/services/local_storage.dart';
import 'package:dio/dio.dart';

class CafeApi {
  static final Dio _dio = Dio();

  static void configureDio() {
    //base del url
    _dio.options.baseUrl = "http://192.168.0.198:8080/api";
    //Configurar Headers
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
    } catch (e) {
      throw ('error en el put');
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
  
  
}
