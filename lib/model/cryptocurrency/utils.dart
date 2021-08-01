import 'package:cold/model/cryptocurrency/coin/coin_enums.dart';

class Utils {
  /// Convert cryptocurrency to string
  static String getCurrencyListString(List<CryptoCurrencyID> currencies) {
    // Create a StringBuffer variable
    StringBuffer stringBuffer = new StringBuffer();
    // Loop through the list
    currencies.forEach((currency) {
      // Append the currency to the StringBuffer
      stringBuffer.write(currency.toString().split('.').last);
      // Append a comma
      stringBuffer.write(',');
    });
    return stringBuffer.toString();
  }

  /// Convert cryptocurrency price type to string
  static String getCurrencyPriceTypeString(
          CryptoCurrencyPriceType cryptoCurrencyPriceType) =>
      cryptoCurrencyPriceType.toString().split('.').last;

  /// Convert cryptocurrency price exchange to string
  static String getCurrencyPriceExchangeString(
          CryptoCurrencyExchange cryptoCurrencyExchange) =>
      cryptoCurrencyExchange.toString().split('.').last;
}
