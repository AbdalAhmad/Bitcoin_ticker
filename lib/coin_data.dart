import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
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
  'BTC',
  'ETH',
  'LTC',
];

/// api call work http convert apikey , and url futrue function instide used uri not string = uri.parse() htttp.respose respinse =  await http.get(request url);
const url = 'http://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=';
const apikey = 'A6C7AD5F-BE92-496D-A669-E4468FB4A728';

class CoinData {
  Future getcoinData() async {
    Uri requesturl = Uri.parse('$url/BTC/USD?apikey=$apikey'); // uri parse for uri not for string

    http.Response response = await http.get(requesturl);
// for checking
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body); // json fro data convert
      var lastprice = decodedData['rate']; // in data rate given
      return lastprice;
    } else {
      print(response.statusCode);
      // for status
      throw 'Problem with the get request';
    }
  }
}
