import 'package:flutter/material.dart';

class TitleHeading extends StatelessWidget {

  final String heading;

  const TitleHeading(this.heading);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 15),
      child:  Text(
        this.heading,
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20 ),
      ),
    );
  }
}
