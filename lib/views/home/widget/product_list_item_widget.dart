import 'package:flutter/material.dart';
import 'package:product_busymed/data/core/api_constants.dart';
import 'package:product_busymed/data/models/products.dart';

class ProductCardWidget extends StatefulWidget {
  final Product product;
  final List<Product> favouriteProducts;
  final Function(Product productCard) onSelected;

  ProductCardWidget(
      {Key key, this.product, this.onSelected, this.favouriteProducts})
      : super(key: key);

  @override
  _ProductCardWidgetState createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Banner(
              message: widget.product.productType,
              location: BannerLocation.topStart,
              color: Colors.blueAccent,
              textStyle: TextStyle(fontWeight: FontWeight.bold),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: buildProductItem(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column buildProductItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: GestureDetector(
            onTap: () {
              this.widget.onSelected(widget.product);
            },
            child: Image.network(
              ApiConstants.BASE_URL +
                  ApiConstants.IMAGE_BASE_LINK +
                  widget.product.image,
              height: 140,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(widget.product.name,
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        Flexible(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(widget.product.brand.name,
              style: TextStyle(color: Colors.grey)),
        ))
      ],
    );
  }
}
