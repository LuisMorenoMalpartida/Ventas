import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuyerHomeScreen extends StatelessWidget {
  const BuyerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // No mostrar la flecha de retroceso
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 100.0),
              child: SvgPicture.asset(
                'assets/Recurso 1.svg',
                height: 40.0,
              ),
            ),
            Spacer(),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            color: Colors.black,
            iconSize: 30.0,
            onPressed: () {
              Navigator.pushNamed(context, '/buyer_profile');
            },
            tooltip: 'Perfil',
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Colors.black,
            iconSize: 30.0,
            onPressed: () {
              Navigator.pushNamed(context, '/buyer_orders');
            },
            tooltip: 'Pedidos',
          ),
        ],
        backgroundColor: Colors.amberAccent,
        toolbarHeight: 70.0,
      ),
      body: Center(
        child: Text('Bienvenido, Comprador!'),
      ),
    );
  }
}