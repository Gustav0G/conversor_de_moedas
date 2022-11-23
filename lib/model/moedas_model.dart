class MoedasModel {
  String code;
  String codein;
  String name;
  String high;
  String low;
  String varBid;
  String pctChange;
  double bid;
  String ask;
  String timestamp;
  String createDate;

  MoedasModel(
      {required this.code,
      required this.codein,
      required this.name,
      required this.high,
      required this.low,
      required this.varBid,
      required this.pctChange,
      required this.bid,
      required this.ask,
      required this.timestamp,
      required this.createDate});

  factory MoedasModel.fromJson(Map json) {
    return MoedasModel(
        code: json['code'],
        codein: json['codein'],
        name: json['name'],
        high: json['high'],
        low: json['low'],
        varBid: json['varBid'],
        pctChange: json['pctChange'],
        bid: double.parse(json['bid']),
        ask: json['ask'],
        timestamp: json['timestamp'],
        createDate: json['create_date']);
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'codein': codein,
        'name': name,
        'high': high,
        'low': low,
        'varBid': varBid,
        'pctChange': pctChange,
        'bid': bid,
        'ask': ask,
        'timestamp': timestamp,
        'create_date': createDate,
      };

  factory MoedasModel.empty() {
    return MoedasModel(
        code: '',
        codein: '',
        name: '',
        high: '',
        low: '',
        varBid: '',
        pctChange: '',
        bid: 0,
        ask: '',
        timestamp: '',
        createDate: '');
  }
}
