library cryptocurrency;

import 'dart:async';
import 'dart:convert' show json;

import 'package:cold/constants.dart';
import 'package:cold/model/cryptocurrency/coin/coin.dart';
import 'package:cold/model/cryptocurrency/coin/coin_enums.dart';
import 'package:cold/model/cryptocurrency/crypto_currency_body.dart';
import 'package:cold/model/cryptocurrency/package/strings.dart';
import 'package:cold/model/cryptocurrency/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// show list of crypto currencies base on give coins IDs
/// [_cryptoIDList] is coin ids
/// [cryptoCurrencyPriceType] is price type
/// [cryptoCurrencyExchange] exchange name
/// [header] is list title, set empty to hide title
/// [itemClickCallBack] is item click call back method
///
class CryptoListWidget extends StatelessWidget {
  final List<CryptoCurrencyID> _cryptoIDList;
  final CryptoCurrencyPriceType cryptoCurrencyPriceType;
  final CryptoCurrencyExchange cryptoCurrencyExchange;
  final String header;
  final Function? itemClickCallBack;

  CryptoListWidget(
    this._cryptoIDList, {
    this.cryptoCurrencyPriceType = CryptoCurrencyPriceType.USD,
    this.cryptoCurrencyExchange = CryptoCurrencyExchange.binance,
    this.header = "",
    this.itemClickCallBack,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, packageSnapshot) {
        if (packageSnapshot.connectionState == ConnectionState.none) {
          return Container(
            child: Text(
              PackageStrings.dataNotFound,
            ),
          );
        }
        if (packageSnapshot.data != null)
          return CryptoCurrencyBody(
            packageSnapshot.data,
            header: header,
            itemClickCallBack: itemClickCallBack,
          );
        else
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
      },
      future: getCryptoCurrencies(
        cryptoCurrencyPriceType,
        cryptoCurrencyExchange,
      ),
    );
  }

  ///  load cryptocurrencies from url
  Future<List<Coin>> getCryptoCurrencies(
      CryptoCurrencyPriceType cryptoCurrencyPriceType,
      CryptoCurrencyExchange cryptoCurrencyExchange) async {
    String coinList = Utils.getCurrencyListString(_cryptoIDList);
    String priceType =
        Utils.getCurrencyPriceTypeString(cryptoCurrencyPriceType);
    String exchangeType =
        Utils.getCurrencyPriceExchangeString(cryptoCurrencyExchange);
    List<Coin> currencies = <Coin>[];
    String apiUrl =
        '$cryptoCurrencyURL$cryptoURL_id$coinList$cryptoURL_convert$priceType$cryptoURL_exchange$exchangeType';
    print(apiUrl);
    http.Response response = await http.get(Uri.parse(apiUrl));
    List l = json.decode(response.body);
    l.forEach((v) {
      currencies.add(Coin.fromJson(v));
    });
    return currencies;
  }
}
