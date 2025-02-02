import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../services/auth_service.dart';

class ProfileScreen extends StatelessWidget {
  final AuthService _authService = AuthService();

  ProfileScreen({super.key});

  void _logout(BuildContext context) {
    _authService.logout();
    Navigator.of(context).pushNamedAndRemoveUntil('/welcome', (route) => false);
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nombre: Usuario de Ejemplo',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 10),
            Text(
              'Correo: usuario@ejemplo.com',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _logout(context),
              child: Text('Cerrar sesión'),
            ),
          ],
        ),
      ),
    );
  }
}