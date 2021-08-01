import 'dart:convert';
import 'package:cold/model/cryptocurrency/coin/coin_price_changes.dart';

class Coin {
  String? id = "";
  String? currency = "";
  String? symbol = "";
  String? name = "";
  String? logoUrl = "";
  String? price = "";
  String? priceDate = "";
  String? priceTimestamp = "";
  String? circulatingSupply = "";
  String? maxSupply = "";
  String? marketCap = "";
  String? rank = "";
  String? high = "";
  String? highTimestamp = "";
  CoinPriceChanges? coinPriceChanges = new CoinPriceChanges();

  Coin({
    this.id,
    this.currency,
    this.symbol,
    this.name,
    this.logoUrl,
    this.price,
    this.priceDate,
    this.priceTimestamp,
    this.circulatingSupply,
    this.maxSupply,
    this.marketCap,
    this.rank,
    this.high,
    this.highTimestamp,
    this.coinPriceChanges,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'currency': currency,
        'symbol': symbol,
        'name': name,
        'logoUrl': logoUrl,
        'price': price,
        'priceDate': priceDate,
        'priceTimestamp': priceTimestamp,
        'circulatingSupply': circulatingSupply,
        'maxSupply': maxSupply,
        'marketCap': marketCap,
        'rank': rank,
        'high': high,
        'highTimestamp': highTimestamp,
      };

  factory Coin.fromMap(Map<String, dynamic> map) => Coin(
        id: map['id'],
        currency: map['currency'],
        symbol: map['symbol'],
        name: map['name'],
        logoUrl: map['logoUrl'],
        price: map['price'],
        priceDate: map['priceDate'],
        priceTimestamp: map['priceTimestamp'],
        circulatingSupply: map['circulatingSupply'],
        maxSupply: map['maxSupply'],
        marketCap: map['marketCap'],
        rank: map['rank'],
        high: map['high'],
        highTimestamp: map['highTimestamp'],
      );

  String toJson() => json.encode(toMap());

  factory Coin.fromJson(String source) => Coin.fromMap(json.decode(source));
}
