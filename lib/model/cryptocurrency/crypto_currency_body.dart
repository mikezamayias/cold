library cryptocurrency;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:cold/model/cryptocurrency/coin/coin.dart';
import 'package:cold/model/cryptocurrency/package/strings.dart';
import 'package:cold/model/cryptocurrency/package/styles.dart';

/// show list of crypto currencies base on give coins IDs
/// [_cryptoIDList] is coin ids
/// [header] is list title, don't set to hide title
/// [itemClickCallBack] is item click call back method
///
///
class CryptoCurrencyBody extends StatelessWidget {
  final List<Coin> _cryptoList;
  final String header;
  final Function? itemClickCallBack;

  CryptoCurrencyBody(
    this._cryptoList, {
    required this.header,
    this.itemClickCallBack,
  });

  @override
  Widget build(BuildContext context) {
    return _buildBody(_cryptoList);
  }

  Widget _buildBody(List<Coin> _currencies) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            _getAppTitleWidget(header),
            _getListViewWidget(_currencies)
          ],
        ),
      ),
    );
  }

  Widget _getAppTitleWidget(String title) {
    if (title == "") return Container();
    return PackageStyle.getTextHeader(title);
  }

  /// generate list
  Widget _getListViewWidget(List<Coin> _currencies) {
    return Flexible(
      child: ListView.builder(
        itemCount: _currencies.length,
        itemBuilder: (context, index) {
          final Coin currency = _currencies[index];
          return GestureDetector(
            child: _getListItemWidget(currency),
            onTap: () => itemClickCallBack!(_currencies[index]),
          );
        },
      ),
    );
  }

  Container _getListItemWidget(Coin currency) {
    return Container(
      margin: const EdgeInsets.only(top: 5.0),
      child: Card(
        child: _getListTile(currency),
      ),
    );
  }

  Container _getListTile(Coin currency) {
    return Container(
        padding: EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            _getLeadingWidget(currency.logoUrl!),
            Container(
              margin: EdgeInsets.only(left: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _getCoinNameWidget(currency.name!, currency.rank!),
                  SizedBox(height: 4),
                  _getPriceText(currency.price!),
                  SizedBox(height: 8),
                  _getPassedDayChangesText(currency),
                ],
              ),
            )
          ],
        ));
  }

  Widget _getLeadingWidget(String url) {
    return SizedBox(
      width: 50,
      height: 50,
      child: SvgPicture.network(
        url,
        placeholderBuilder: (BuildContext context) => Container(
            padding: const EdgeInsets.all(30.0),
            child: const CircularProgressIndicator()),
      ),
    );
  }

  Text _getCoinNameWidget(String currencyName, String rank) =>
      PackageStyle.getTextTitle("#$rank. $currencyName");

  Text _getPriceText(String priceUsd) => PackageStyle.getTextSubTitle(priceUsd);

  Text _getPassedDayChangesText(Coin coin) {
    String percentChangeText =
        "${PackageStrings.passedDayChange} ${coin.coinPriceChanges!.priceChange ?? ""}";
    Text percentChangeTextWidget;

    if (double.parse(coin.coinPriceChanges!.priceChange ?? "0") > 0) {
      percentChangeTextWidget = Text(
        percentChangeText,
        style: TextStyle(color: Colors.green),
      );
    } else {
      percentChangeTextWidget = Text(
        percentChangeText,
        style: TextStyle(color: Colors.red),
      );
    }

    return percentChangeTextWidget;
  }
}
