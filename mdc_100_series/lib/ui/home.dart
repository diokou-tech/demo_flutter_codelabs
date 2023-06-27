import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shrine/model/product.dart';
import 'package:shrine/model/products_repository.dart';
import 'package:shrine/supplemental/asymmetric_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("Shop"),
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        leading: Icon(Icons.shop),
        actions: [
          isSearch == true
              ? SizedBox(
                  width: 100,
                  child: TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    onEditingComplete: () {
                      setState(() {
                        isSearch = false;
                      });
                    },
                  ))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isSearch = true;
                    });
                  },
                  icon: Icon(Icons.search)),
          IconButton(onPressed: null, icon: Icon(Icons.shopping_bag_rounded)),
          IconButton(onPressed: null, icon: Icon(Icons.filter_alt_outlined)),
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/login");
              },
              icon: Icon(Icons.logout_rounded))
        ],
      ),
      // body: GridView.count(
      //   crossAxisCount: 2,
      //   padding: EdgeInsets.all(16.8),
      //   childAspectRatio: 8.0 / 9.0,
      //   children: _buildGridCards(context),
      // ),
      body: AsymmetricView(
        products: ProductsRepository.loadProducts(Category.all),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  // ignore: unused_element
  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(
                product.assetName,
                fit: BoxFit.fitWidth,
                package: product.assetPackage,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      product.name,
                      style: theme.textTheme.titleLarge,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      formatter.format(product.price),
                      style: theme.textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}
