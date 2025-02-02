import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _authService = AuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      final user = await _authService.login(_emailController.text, _passwordController.text);

      setState(() => _isLoading = false);

      if (user != null) {
        // ignore: use_build_context_synchronously
        final role = ModalRoute.of(context)?.settings.arguments as Map<String, String>? ?? {};
        if (role['role'] == 'buyer') {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacementNamed(context, '/buyer_home');
        } else if (role['role'] == 'seller') {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacementNamed(context, '/home');
        }
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Credenciales inválidas'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        child: SingleChildScrollView( // Añadir SingleChildScrollView para evitar overflow
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  focusNode: _emailFocus,
                  decoration: InputDecoration(
                    labelText: _emailFocus.hasFocus ? '' : 'Correo electrónico',
                    labelStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa un correo';
                    }
                    return null;
                  },
                  onTap: () {
                    setState(() {
                      _emailController.clear();
                    });
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  focusNode: _passwordFocus,
                  decoration: InputDecoration(
                    labelText: _passwordFocus.hasFocus ? '' : 'Contraseña',
                    labelStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: TextStyle(color: Colors.black),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa una contraseña';
                    }
                    return null;
                  },
                  onTap: () {
                    setState(() {
                      _passwordController.clear();
                    });
                  },
                ),
                SizedBox(height: 30),
                _isLoading
                    ? CircularProgressIndicator()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                            onPressed: _login,
                            icon: Icon(Icons.login, color: Colors.white),
                            label: Text('Iniciar Sesión', style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            icon: Icon(Icons.app_registration, color: Colors.white),
                            label: Text('Registrarse' , style: TextStyle(color: Colors.white),),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}