import 'package:flutter/material.dart';
import 'package:product_busymed/data/models/products.dart';
import 'package:product_busymed/views/home/widget/product_list_item_widget.dart';

class FavouriteModal extends StatelessWidget {
  final List<Product> favourites;

  const FavouriteModal({Key key, this.favourites}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    favourites.sort((a, b) {
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:
            Text("you have " + favourites.length.toString() + " liked items"),
        elevation: 0,
      ),
      body: Container(
        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        padding: EdgeInsets.symmetric(horizontal: 20),
        // height: 300,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 40,
            mainAxisSpacing: 40,
            crossAxisCount: 2,
            childAspectRatio: 0.75,
          ),
          itemCount: favourites.length,
          itemBuilder: (BuildContext context, int index) {
            var list = favourites[index];

            return ProductCardWidget(
              product: list,

              // favouriteProducts: favouriteList,
            );
          },
        ),
      ),
    );
  }
}
