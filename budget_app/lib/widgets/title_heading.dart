import 'package:flutter/material.dart';

class TitleHeading extends StatelessWidget {

  final String heading;

  TitleHeading(this.heading);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 15),
      child: Text(
        this.heading,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20 ),
      ),
    );
  }
}
