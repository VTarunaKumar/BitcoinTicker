import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currentList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];
const List<String> cryptoList = [
  "BTC",
  "ETH",
  "LTC",
];
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = "132BCB78-A6DE-4499-B1BF-87353E95C15B";

class CoinData {
  Future getCoinData() async {
    String requestURL = "$coinAPIURL/BTC/USD?apikey=$apiKey";
    // http.Response response
    http.Response response = await http.get(Uri.parse(requestURL));
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      print(lastPrice);
      return lastPrice;
    } else {
      print(response.statusCode);
      throw "Problem with the getRequest";
    }
  }
}
