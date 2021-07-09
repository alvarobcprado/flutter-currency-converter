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

  Future<List<Currency>> fetchCurrencyList() async {
    final currencies = await fetchData();
    final List<Currency> listCurrencies = <Currency>[
      currencies.brl,
      currencies.usd,
      currencies.eur,
      currencies.btc,
      currencies.cad,
      currencies.ars,
      currencies.aud,
      currencies.jpy,
      currencies.cny
    ];
    return listCurrencies;
  }
}
