import 'package:crypto_coin/Widget/coin_list.dart';
import 'package:flutter/material.dart';
import '../Services/coin_api.dart';
import '../Widget/app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    CoinApi coinApi = CoinApi();
    TextEditingController searchController= TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: AppBarWidget(title: 'CRYPTO WORLD',),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Coin Name",
                    prefixIcon: Icon(Icons.search),
                  ),
                  onSubmitted: (value){
                    setState(() {
                      print(value);
                    });
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: FutureBuilder(
              future: coinApi.cryptoData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return ListView.builder(
                  itemCount: coinApi.coinDataList.length.toInt(),
                  itemBuilder: (context, index) {
                    if(snapshot.hasData){
                      if(searchController.text.isEmpty){
                        return CoinList(
                          image: coinApi.coinDataList[index]['image'],
                          name: coinApi.coinDataList[index]['name'],
                          symbol: coinApi.coinDataList[index]['symbol'],
                          current_price: coinApi.coinDataList[index]['current_price'],
                          price_change: coinApi.coinDataList[index]['price_change_24h'],
                          price_change_percentage: coinApi.coinDataList[index]['price_change_percentage_24h'],
                          index: index,

                        );
                      }else if(coinApi.coinDataList[index]['name'].toLowerCase().contains(searchController.text.toLowerCase())){
                        return CoinList(
                          image: coinApi.coinDataList[index]['image'],
                          name: coinApi.coinDataList[index]['name'],
                          symbol: coinApi.coinDataList[index]['symbol'],
                          current_price: coinApi.coinDataList[index]['current_price'],
                          price_change: coinApi.coinDataList[index]['price_change_24h'],
                          price_change_percentage: coinApi.coinDataList[index]['price_change_percentage_24h'],
                          index: index,

                        );
                      }else{
                        return Container(
                          child: Center(child: Text("No Data"),),
                        );
                      }
                    }else{
                      return const Center(child: CircularProgressIndicator(),);
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
