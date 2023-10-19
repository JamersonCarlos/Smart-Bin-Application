import 'package:dio/dio.dart';

class ApiService {
  final dio = Dio();
  final String baseUrl = "https://smart-bin-22ac8d4ed155.herokuapp.com/";

  Future<List<dynamic>> getAllBins() async {
    final result = await dio.get("${baseUrl}allbins");
    return result.data['data'];
  }
}
