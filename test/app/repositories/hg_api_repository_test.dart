import 'package:currency_converter/app/models/hg_api_model.dart';
import 'package:currency_converter/app/repositories/hg_api_repository.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final repo = HgApiRepository();
  test(
    'Deve retornar uma instância de HgApiModel',
    () async {
      var data = await repo.fetchData();
      //print(data["source"] + data['USD']['name']);
      print(isA<HgApiModel>());
      expect(data, isA<HgApiModel>());
    },
  );
}
