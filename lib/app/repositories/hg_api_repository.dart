import 'package:currency_converter/app/models/hg_api_model.dart';
import 'package:dio/dio.dart';

class HgApiRepository {
  var dio = Dio();
  var baseUrl = 'https://api.hgbrasil.com/finance';

  Future<HgApiModel> fetchData() async {
    try {
      var response = await dio.get(baseUrl);
      var data = response.data["results"]["currencies"] as Map<String, dynamic>;
      HgApiModel currencyData = HgApiModel.fromJson(data);
      return currencyData;
    } catch (e) {
      throw Exception("Deu algo errado hein, esse foi o erro: $e");
    }
  }
}
