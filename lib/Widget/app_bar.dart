import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget({Key? key,required this.title}) : super(key: key);
 String? title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: TextStyle(
        color: Colors.deepPurple,
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    );
  }
}
