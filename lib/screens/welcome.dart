import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.asset(
                  'assets/Recurso 2.jpg',
                  height: 300.0,
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login', arguments: {'role': 'buyer'});
                    },
                    icon: Icon(Icons.shopping_cart, color: Colors.white),
                    label: Text('Voy a comprar', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login', arguments: {'role': 'seller'});
                    },
                    icon: Icon(Icons.store, color: Colors.white),
                    label: Text('Voy a vender', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}