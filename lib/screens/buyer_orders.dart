import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuyerOrdersScreen extends StatelessWidget {
  const BuyerOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 110.0),
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
      body: Center(
        child: Text('Lista de Pedidos del Comprador'),
      ),
    );
  }
}