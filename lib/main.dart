import 'package:flutter/material.dart';
import 'package:foruandher/providers/cart.dart';
import 'package:foruandher/providers/orders.dart';
import 'package:foruandher/providers/products.dart';
import 'package:foruandher/screens/cart_screen.dart';
import 'package:foruandher/screens/edit_product_screen.dart';
import 'package:foruandher/screens/orders_screen.dart';
import 'package:foruandher/screens/product_detail_screen.dart';
import 'package:foruandher/screens/products_overview_screen.dart';
import 'package:foruandher/screens/user_products_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'For U & her',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrangeAccent,
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
          EditProductScreen.routeName:(ctx)=>EditProductScreen(),
        },
      ),
    );
  }
}
