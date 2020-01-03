import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './product_item.dart';
import '../providers/products_provoder.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  ProductsGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {

    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favoriteItems :  productsData.items;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        childAspectRatio: 2/3,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        // builder: (c) => products[i],
        value: products[i],
         child: ProductItem(
      //      products[i].id,
      //      products[i].title,
      //      products[i].imageUrl
        ),
      ),
      itemCount: products.length,
      padding: const EdgeInsets.all(10.0),
    );
  }
}
