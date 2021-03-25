import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:product_busymed/data/core/api_constants.dart';
import 'package:product_busymed/data/models/products.dart';
import 'package:product_busymed/utils/loading.dart';
import 'package:product_busymed/view_models/product_view_model.dart';
import 'package:product_busymed/views/home/pages/favourite.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> favouriteProductsList = [];
  GlobalKey _toolTipKey = GlobalKey();
  @override
  void initState() {
    Provider.of<ProductViewModel>(context, listen: false).getProduct();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final dynamic tooltip = _toolTipKey.currentState;
      tooltip.ensureTooltipVisible();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Medical Products",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold)),
          elevation: 0,
          actions: [
            Stack(
              children: [
                Tooltip(
                  key: _toolTipKey,
                  message: "Click to view liked products",
                  child: IconButton(
                      icon: Icon(
                        Icons.favorite,
                        size: 32,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        _showFavouriteModal(favouriteProductsList);
                      }),
                ),
                Text(favouriteProductsList.length.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: Consumer<ProductViewModel>(
          builder:
              (BuildContext ctx, ProductViewModel productViewModel, Widget _) {
            return SafeArea(
                child: checkStatus(productViewModel, favouriteProductsList));
          },
        ));
  }

  _showFavouriteModal(List<Product> list) {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => FavouriteModal(favourites: list)));
  }

  Widget checkStatus(
      ProductViewModel productViewModel, List<Product> favouriteList) {
    switch (productViewModel.fetchState) {
      case LoadingStatus.done:
        return createList(productViewModel, favouriteList);
        break;
      case LoadingStatus.error:
        return Container(child: Text("an error occured"));
        break;
      case LoadingStatus.fetching:
        return Center(child: CircularProgressIndicator());
        break;
      case LoadingStatus.not_fetched:
        return Container(child: Text("could not retrieve your products"));
        break;
      default:
        return Container(child: Text("something went wrong"));
    }
  }

  Widget createList(
      ProductViewModel productViewModel, List<Product> favouriteList) {
    return Container(
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
        itemCount: productViewModel.productList.length,
        itemBuilder: (BuildContext context, int index) {
          var list = productViewModel.productList[index];

          return productCardWidget(
            product: list,

            // favouriteProducts: favouriteList,
          );
        },
      ),
    );
  }

  productCardWidget({Product product}) {
    bool isSaved = favouriteProductsList.contains(product);
    return ClipRect(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Banner(
              message: product.productType,
              location: BannerLocation.topStart,
              color: Colors.blueAccent,
              textStyle: TextStyle(fontWeight: FontWeight.bold),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: buildProductItem(product: product),
              ),
            ),
          ),
          IconButton(
              icon: Icon(
                isSaved ? Icons.favorite : Icons.favorite_border,
                // size: 16,
                color: Colors.red,
              ),
              onPressed: () {
                setState(() {
                  if (isSaved) {
                    favouriteProductsList.remove(product);
                  } else {
                    favouriteProductsList.add(product);
                  }
                });
              }),
        ],
      ),
    );
  }

  Column buildProductItem({Product product}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: GestureDetector(
            onTap: () {},
            child: Image.network(
              ApiConstants.BASE_URL +
                  ApiConstants.IMAGE_BASE_LINK +
                  product.image,
              height: 140,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(product.name,
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        Flexible(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(product.brand.name, style: TextStyle(color: Colors.grey)),
        ))
      ],
    );
  }
}
