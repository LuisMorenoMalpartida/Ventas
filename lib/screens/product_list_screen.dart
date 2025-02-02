import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final List<Map<String, dynamic>> _products = [
    {'id': '1', 'name': 'Producto 1', 'price': 99.99},
    {'id': '2', 'name': 'Producto 2', 'price': 149.99},
    {'id': '3', 'name': 'Producto 3', 'price': 79.99},
  ];

  void _addProduct() {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController priceController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Agregar Producto'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nombre del Producto'),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Precio'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                final String name = nameController.text.trim();
                final String priceText = priceController.text.trim();
                if (name.isNotEmpty && priceText.isNotEmpty) {
                  final double? price = double.tryParse(priceText);
                  if (price != null) {
                    setState(() {
                      _products.add({
                        'id': (_products.length + 1).toString(),
                        'name': name,
                        'price': price,
                      });
                    });
                    Navigator.pop(context);
                  }
                }
              },
              child: Text('Agregar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 55.0),
              child: SvgPicture.asset(
                'assets/Recurso 1.svg',
                height: 40.0,
              ),
            ),
            Spacer(),
          ],
        ),
        backgroundColor: Colors.amberAccent,
        toolbarHeight: 70.0,
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return ListTile(
            title: Text(product['name']),
            subtitle: Text('\$${product['price']}'),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/product-detail',
                arguments: product,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addProduct,
        backgroundColor: Colors.amberAccent,
        child: Icon(Icons.add),
      ),
    );
  }
}
