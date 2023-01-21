import 'package:flutter/material.dart';

class DetailsWidget extends StatelessWidget {
   DetailsWidget({Key? key,required this.current_price, required this.value}) : super(key: key);
  String? current_price;
  String? value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Container(
        height: 60,
        width: double.infinity,
        child: Card(
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  current_price!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                Text(
                  value!,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
