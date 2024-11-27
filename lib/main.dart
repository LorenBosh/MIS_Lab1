import 'package:flutter/material.dart';

void main() {
  runApp(ClothingStoreApp());
}

class ClothingStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clothing Store',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: "T-Shirt",
      image: "assets/resources/image0.jpg",
      description: "A comfortable cotton T-Shirt",
      price: "\$20",
    ),
    Product(
      name: "Dress",
      image: "assets/resources/image1.jpg",
      description: "Girls dress",
      price: "\$70",
    ),
    Product(
      name: "Jacket",
      image: "assets/resources/image2.jpg",
      description: "Autumn jacket",
      price: "\$100",
    ),
    Product(
      name: "Jeans",
      image: "assets/resources/image3.jpg",
      description: "Men's jeans",
      price: "\$60",
    ),
    Product(
      name: "Sweater",
      image: "assets/resources/image4.jpg",
      description: "100% wool sweater",
      price: "\$80",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('211084'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 4,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(product: products[index]),
                ),
              );
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      products[index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      products[index].name,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                product.image,
                height: 200,
              ),
            ),
            SizedBox(height: 20),
            Text(
              product.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              product.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              "Price: ${product.price}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final String image;
  final String description;
  final String price;

  Product({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });
}