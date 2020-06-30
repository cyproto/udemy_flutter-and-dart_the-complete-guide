import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/product_details_screen.dart';
import './screens/products_overview_screens.dart';
import './providers/products.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.redAccent,
          fontFamily: 'Montserrat',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailsScreen.route: (context) => ProductDetailsScreen(),
        },
      ),
    );
  }
}
