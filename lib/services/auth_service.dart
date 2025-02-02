import '../models/user_model.dart';

class AuthService {
  // Lista de usuarios simulada
  final List<User> _users = [
    User(id: '1', name: 'Usuario', email: 'usuario@ejemplo.com'),
    User(id: '2', name: 'Admin', email: 'admin@ejemplo.com')
  ];

  // Método de inicio de sesión simulado
  Future<User?> login(String email, String password) async {
    try {
      await Future.delayed(Duration(seconds: 1)); // Simular tiempo de conexión

      // Validación del usuario
      final user = _users.firstWhere(
        (u) => u.email == email,
        orElse: () => throw 'Usuario no encontrado',
      );

      return user; // Simulación de autenticación sin contraseña
    } catch (e) {
      return null;
    }
  }

  // Método de registro de usuario
  Future<bool> register(String name, String email, String password) async {
    await Future.delayed(Duration(seconds: 1)); // Simular tiempo de conexión

    // Verificar si el usuario ya existe
    final userExists = _users.any((u) => u.email == email);
    if (userExists) {
      return false; // Usuario ya existe
    }

    // Crear y agregar el nuevo usuario
    final newUser = User(id: DateTime.now().millisecondsSinceEpoch.toString(), name: name, email: email);
    _users.add(newUser);

    return true; // Registro exitoso
  }

  void logout() {}
}
