import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foruandher/screens/edit_product_screen.dart';
import 'package:foruandher/widgets/app_drawer.dart';
import 'package:foruandher/widgets/user_product_item.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context, listen: false).fetchAndSetProducts();
  }

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
                Navigator.of(context).pushNamed(EditProductScreen.routeName);
              })
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
              itemCount: productsData.items.length,
              itemBuilder: (_, i) => Column(children: [
                    UserProductItem(
                        id: productsData.items[i].id,
                        title: productsData.items[i].title,
                        imageUrl: productsData.items[i].imageUrl),
                    Divider()
                  ])),
        ),
      ),
    );
  }
}
