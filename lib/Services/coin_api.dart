import 'dart:convert';
import 'package:http/http.dart' as http;

class CoinApi {
  List coinDataList = [];
  Future<List> cryptoData() async {
    try{
      var response = await http.get(Uri.parse(
          "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false"));
      var data = jsonDecode(response.body);
      coinDataList.clear();
      for(Map i in data){
        coinDataList.add(i);
      }
      return coinDataList;
    }catch(e){
      print(e);
    }
    return coinDataList;
  }
}


