import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {

//  final String id;
//  final String title;
//  final String imageUrl;
  //ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return  ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetailScreen.routeName, arguments: product.id );
              },
            child: Image.network(product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            title: Text(product.title, textAlign: TextAlign.center,),
            backgroundColor: Colors.black45,
            leading: Consumer<Product>(
              builder: (ctx, product, _) => IconButton(icon:
               product.isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
                  color: Colors.pinkAccent,
                  onPressed: () {
                    product.toggleFavoriteStatus();
                  }),  
            ),
            trailing: IconButton(icon: Icon(Icons.shopping_cart),color: Colors.pinkAccent, onPressed: () {}),

          ),
        ),
      );
  }
}


/* navigation
onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => ProductDetailScreen(title)),
            );
          }
 */