import 'package:dio/dio.dart';

class ApiService {
  final dio = Dio();
  final String baseUrl = "http://192.168.0.109:3000/";

  Future<List<dynamic>> getAllBins() async {
    final result = await dio.get("${baseUrl}allbins");
    return result.data['data'];
  }
}
