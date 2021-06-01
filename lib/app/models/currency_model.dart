class CurrencyModel {
  final String name;
  final double brl;
  final double usd;
  final double eur;
  final double btc;
  final double eth;
  final double doge;
  CurrencyModel({
    required this.name,
    required this.brl,
    required this.usd,
    required this.eur,
    required this.btc,
    required this.eth,
    required this.doge,
  });

  static List<CurrencyModel> getCurrencies() {
    return <CurrencyModel>[
      CurrencyModel(
        name: "brl",
        brl: 1.0,
        usd: 0.30,
        eur: 0.20,
        btc: 0.0000005,
        eth: 0.00008,
        doge: 0.5,
      ),
      CurrencyModel(
        name: "usd",
        brl: 5.30,
        usd: 1.0,
        eur: 0.8,
        btc: 0.00005,
        eth: 0.0004,
        doge: 0.1,
      ),
      CurrencyModel(
        name: "eur",
        brl: 6.60,
        usd: 1.18,
        eur: 1.0,
        btc: 0.000004,
        eth: 0.0003,
        doge: 0.1,
      ),
      CurrencyModel(
        name: "btc",
        brl: 200000,
        usd: 37000,
        eur: 35000,
        btc: 1,
        eth: 40,
        doge: 1000,
      ),
      CurrencyModel(
        name: "eth",
        brl: 16000,
        usd: 1500,
        eur: 1100,
        btc: 0.0004,
        eth: 1,
        doge: 100,
      ),
      CurrencyModel(
        name: "doge",
        brl: 1.6,
        usd: 0.8,
        eur: 0.6,
        btc: 0.000004,
        eth: 0.0003,
        doge: 1,
      ),
    ];
  }
}
