import 'package:crypto_coin/Widget/details_widget.dart';
import 'package:flutter/material.dart';
import '../Services/coin_api.dart';
import '../Widget/app_bar.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({Key? key, required this.index}) : super(key: key);
  var index;
  CoinApi coinApi = CoinApi();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: AppBarWidget(title: 'Details',),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: coinApi.cryptoData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Container(
                        height: h * 0.2,
                        width: w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(40),
                              bottomLeft: Radius.circular(40)),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(35),
                                  border: Border.all(color: Colors.white),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 5,
                                      spreadRadius: 2,
                                      offset: Offset(4, 4),
                                    ),
                                    BoxShadow(
                                      color: Colors.white,
                                      blurRadius: 5,
                                      spreadRadius: 2,
                                      offset: Offset(-4, -4),
                                    ),
                                  ]),
                              child: Image(
                                image: NetworkImage(coinApi.coinDataList[index]['image']),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              coinApi.coinDataList[index]['name'],
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(height: 5,),
                      DetailsWidget(current_price: "Current Price:", value: coinApi.coinDataList[index]['current_price'].toString()),
                      SizedBox(height: 5,),
                      DetailsWidget(current_price: "High 24h:", value: coinApi.coinDataList[index]['high_24h'].toString()),
                      SizedBox(height: 5,),
                      DetailsWidget(current_price: "Low 24h:", value: coinApi.coinDataList[index]['low_24h'].toString()),
                      SizedBox(height: 5,),
                      DetailsWidget(current_price: "Total Volume:", value: coinApi.coinDataList[index]['total_volume'].toString()),
                      SizedBox(height: 5,),
                      DetailsWidget(current_price: "Market Cap:", value: coinApi.coinDataList[index]['market_cap'].toString()),
                      SizedBox(height: 5,),
                      DetailsWidget(current_price: "Market Cap Rank:", value: coinApi.coinDataList[index]['market_cap_rank'].toString()),
                      SizedBox(height: 5,),
                      DetailsWidget(current_price: "Price-Change:", value: coinApi.coinDataList[index]['price_change_24h'].toString()),
                      SizedBox(height: 5,),
                      DetailsWidget(current_price: "Price-Change %:", value: "${coinApi.coinDataList[index]['price_change_percentage_24h'].toString()}%"),
                      SizedBox(height: 5,),
                      DetailsWidget(current_price: "Market Cap Change:", value: coinApi.coinDataList[index]['market_cap_change_24h'].toString()),
                      SizedBox(height: 5,),
                      DetailsWidget(current_price: "Market Cap Change %:", value: "${coinApi.coinDataList[index]['market_cap_change_percentage_24h'].toString()}%"),
                      SizedBox(height: 5,),
                      DetailsWidget(current_price: "Circulating Supply:", value: coinApi.coinDataList[index]['circulating_supply'].toString()),
                      SizedBox(height: 5,),
                      DetailsWidget(current_price: "Total Supply:", value: coinApi.coinDataList[index]['total_supply'].toString()),
                      SizedBox(height: 5,),
                      DetailsWidget(current_price: "Max Supply:", value: coinApi.coinDataList[index]['max_supply'].toString()),
                    ],
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
