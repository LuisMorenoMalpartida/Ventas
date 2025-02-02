import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtiene los argumentos pasados desde la pantalla de lista de productos
    final Map<String, dynamic> product = 
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 60.0),
              child: SvgPicture.asset(
                'assets/Recurso 1.svg',
                height: 40.0,
              ),
            ),
            Spacer(),
          ],
        ),
      backgroundColor: Colors.amberAccent,
      toolbarHeight: 70.0,),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product['name'],
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 10),
            Text(
              'Precio: \$${product['price']}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            // Aquí puedes añadir más detalles del producto
          ],
        ),
      ),
    );
  }
}