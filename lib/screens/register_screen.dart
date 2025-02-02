import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _authService = AuthService();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void _register() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      final success = await _authService.register(
        _nameController.text,
        _emailController.text,
        _passwordController.text,
      );

      setState(() => _isLoading = false);

      if (success) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('El usuario ya existe'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Widget _buildTextField(TextEditingController controller, FocusNode focusNode, String label, {bool obscureText = false}) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        labelText: focusNode.hasFocus ? '' : label,
        labelStyle: const TextStyle(color: Colors.black),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      style: const TextStyle(color: Colors.black),
      obscureText: obscureText,
      validator: (value) => value == null || value.isEmpty ? 'Por favor ingresa $label' : null,
      onTap: () {
        setState(() {
          controller.clear();
        });
      },
    );
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
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Añadir SingleChildScrollView para evitar overflow
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTextField(_nameController, _nameFocus, 'Nombre'),
                const SizedBox(height: 16.0),
                _buildTextField(_emailController, _emailFocus, 'Correo electrónico'),
                const SizedBox(height: 16.0),
                _buildTextField(_passwordController, _passwordFocus, 'Contraseña', obscureText: true),
                const SizedBox(height: 20),
                _isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton.icon(
                      onPressed: _register,
                      icon: Icon(Icons.app_registration, color: Colors.white),
                      label: const Text('Registrarse'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(fontWeight: FontWeight.bold),
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}