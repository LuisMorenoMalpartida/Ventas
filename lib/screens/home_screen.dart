import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bienvenido a Mi Tienda Online',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sell-product');
              },
              child: Text('Vender Producto'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Productos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              // Permanecemos en la pantalla de inicio
              break;
            case 1:
              Navigator.pushNamed(context, '/products');
              break;
            case 2:
              Navigator.pushNamed(context, '/profile');
              break;
          }
        },
      ),
    );
  }
}