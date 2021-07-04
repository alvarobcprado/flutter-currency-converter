class HgApiModel {
  late String source;
  late Currency usd;
  late Currency eur;
  late Currency gbp;
  late Currency ars;
  late Currency cad;
  late Currency aud;
  late Currency jpy;
  late Currency cny;
  late Currency btc;

  HgApiModel({
    required this.source,
    required this.usd,
    required this.eur,
    required this.gbp,
    required this.ars,
    required this.cad,
    required this.aud,
    required this.jpy,
    required this.cny,
    required this.btc,
  });

  HgApiModel.fromJson(Map<String, dynamic> json) {
    source = json['source'];
    usd = json['USD'] = Currency.fromJson(json['Currency']);
    eur = json['EUR'] = Currency.fromJson(json['EUR']);
    gbp = json['GBP'] = Currency.fromJson(json['GBP']);
    ars = json['ARS'] = Currency.fromJson(json['ARS']);
    cad = json['CAD'] = Currency.fromJson(json['CAD']);
    aud = json['AUD'] = Currency.fromJson(json['AUD']);
    jpy = json['JPY'] = Currency.fromJson(json['JPY']);
    cny = json['CNY'] = Currency.fromJson(json['CNY']);
    btc = json['BTC'] = Currency.fromJson(json['BTC']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['source'] = this.source;
    data['USD'] = this.usd.toJson();
    data['EUR'] = this.eur.toJson();
    data['GBP'] = this.gbp.toJson();
    data['ARS'] = this.ars.toJson();
    data['CAD'] = this.cad.toJson();
    data['AUD'] = this.aud.toJson();
    data['JPY'] = this.jpy.toJson();
    data['CNY'] = this.cny.toJson();
    data['BTC'] = this.btc.toJson();
    return data;
  }
}

class Currency {
  late String name;
  late double buy;

  Currency({required this.name, required this.buy});

  Currency.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    buy = json['buy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['buy'] = this.buy;
    return data;
  }
}
