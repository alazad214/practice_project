import 'package:flutter/material.dart';

class ProductListWithAdsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {'name': 'Product 1', 'price': '\$10'},
    {'name': 'Product 2', 'price': '\$20'},
    {'name': 'Product 3', 'price': '\$30'},
    {'name': 'Product 4', 'price': '\$40'},
    {'name': 'Product 5', 'price': '\$50'},
    {'name': 'Product 6', 'price': '\$60'},
    {'name': 'Product 7', 'price': '\$70'},
    {'name': 'Product 8', 'price': '\$80'},
    {'name': 'Product 9', 'price': '\$90'},
    {'name': 'Product 10', 'price': '\$100'},
  ];

  ProductListWithAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> itemList = [];
    bool adShown = false;

    for (int i = 0; i < products.length; i++) {
      itemList.add(ProductCard(
        name: products[i]['name'],
        price: products[i]['price'],
      ));
      if (!adShown && i == 1) {
        itemList.add(const FullWidthAdWidget());
        adShown = true;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List with Ads'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: itemList,
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String price;

  const ProductCard({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 36) / 2,
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.shopping_bag),
              title: Text(name),
              subtitle: Text(price),
            ),
          ],
        ),
      ),
    );
  }
}

class FullWidthAdWidget extends StatelessWidget {
  const FullWidthAdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Full width container
      height: 100,
      margin: const EdgeInsets.only(bottom: 12),
      color: Colors.amber.shade200,
      child: const Center(
        child: Text(
          'Sponsored Ad - Full Width',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
