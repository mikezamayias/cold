import 'dart:convert';

class CoinPriceChanges {
  String? volume;
  String? priceChange;
  String? priceChangePct;
  String? volumeChange;
  String? volumeChangePct;
  String? marketCapChange;
  String? marketCapChangePct;

  CoinPriceChanges({
    this.volume,
    this.priceChange,
    this.priceChangePct,
    this.volumeChange,
    this.volumeChangePct,
    this.marketCapChange,
    this.marketCapChangePct,
  });

  Map<String, dynamic> toMap() => {
        'volume': volume,
        'priceChange': priceChange,
        'priceChangePct': priceChangePct,
        'volumeChange': volumeChange,
        'volumeChangePct': volumeChangePct,
        'marketCapChange': marketCapChange,
        'marketCapChangePct': marketCapChangePct,
      };

  factory CoinPriceChanges.fromMap(Map<String, dynamic> map) =>
      CoinPriceChanges(
        volume: map['volume'],
        priceChange: map['priceChange'],
        priceChangePct: map['priceChangePct'],
        volumeChange: map['volumeChange'],
        volumeChangePct: map['volumeChangePct'],
        marketCapChange: map['marketCapChange'],
        marketCapChangePct: map['marketCapChangePct'],
      );

  String toJson() => json.encode(toMap());

  factory CoinPriceChanges.fromJson(String source) =>
      CoinPriceChanges.fromMap(json.decode(source));
}
