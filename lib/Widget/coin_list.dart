import 'package:crypto_coin/Pages/details_page.dart';
import 'package:flutter/material.dart';

class CoinList extends StatelessWidget {
  String? image;
  String? name;
  String? symbol;
  double? current_price;
  double? price_change;
  double? price_change_percentage;
  int? index;

  CoinList(
      {super.key, required this.image,
      required this.name,
      required this.symbol,
      required this.current_price,
      required this.price_change,
      required this.price_change_percentage,
      required this.index});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage(index: index,)));
        },
        child: Container(
          height: 80,
          width: w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(image: NetworkImage(image!)),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.deepPurple),
                        ),
                        Text(
                          symbol!,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      current_price.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.deepPurple),
                    ),
                    Text(
                      price_change.toString(),
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14,color: price_change!<0?Colors.red:Colors.green),
                    ),
                    Text(
                      "${price_change_percentage}%",
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14,color: price_change_percentage!<0?Colors.red:Colors.green),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
