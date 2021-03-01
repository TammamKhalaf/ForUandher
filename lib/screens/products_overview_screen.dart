import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/TAMMAM/foruandher/lib/providers/product.dart';
import 'package:foruandher/widgets/product_item.dart';
import 'package:foruandher/widgets/products_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('For U & her'),
      ),
      body: ProductsGrid(),
    );
  }
}


