import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foruandher/widgets/app_drawer.dart';
import 'package:foruandher/widgets/user_product_item.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                //...
              })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: productsData.items.length,
            itemBuilder: (_, i) => Column(children: [
                  UserProductItem(
                      title: productsData.items[i].title,
                      imageUrl: productsData.items[i].imageUrl),
                  Divider()
                ])),
      ),
    );
  }
}
