import 'package:flutter/material.dart';
import 'package:foruandher/providers/auth.dart';
import 'package:foruandher/providers/cart.dart';
import 'package:foruandher/providers/orders.dart';
import 'package:foruandher/providers/products.dart';
import 'package:foruandher/screens/auth_screen.dart';
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
        ChangeNotifierProvider(create: (ctx) => Auth()),
        ChangeNotifierProxyProvider<Auth, Products>(
          update: (ctx, auth, previousProducts) => Products(
              auth.token,
              auth.userId,
              previousProducts == null ? [] : previousProducts.items),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProxyProvider<Auth,Orders>(
          update: (ctx, auth, previousOrders) => Orders(auth.token, auth.userId,
              previousOrders == null ? [] : previousOrders.orders),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'For U\n& her',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrangeAccent,
            fontFamily: 'Lato',
          ),
          home: auth.isAuth ? ProductsOverviewScreen() : AuthScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
            UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
            EditProductScreen.routeName: (ctx) => EditProductScreen(),
          },
        ),
      ),
    );
  }
}
