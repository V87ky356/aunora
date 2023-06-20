import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../ui/input_decoration.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

  Future<void> loginUser(String email, String password) async {
    final apiUrl = 'http://190.187.114.165:8000/api-user/login/';

    final response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'email': email,
        'password': password,
        'tipo_usuario': 'AUNOR',
      },
    );

    if (response.statusCode == 200) {
      // El inicio de sesión fue exitoso
      final responseData = json.decode(response.body);
      print('Inicio de sesión exitoso');
      print('Datos del usuario: $responseData');
      // Realizar acciones adicionales después del inicio de sesión exitoso
    } else {
      // El inicio de sesión falló
      print('Error de inicio de sesión');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              const SizedBox(height: 150),
              const Center(
                child: Image(image: AssetImage('assets/img/logo.png')),
              ),
              const Text(
                'Aplicativo móvil de Seguridad y Salud en el',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                'Trabajo',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 80),
              _LoginForm(loginUser: loginUser),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  final Function(String, String) loginUser;

  const _LoginForm({required this.loginUser});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                'Usuario',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          TextFormField(
            autocorrect: false,
            onChanged: (value) {},
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
              hintText: 'Ingrese Usuario',
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                'Contraseña',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          TextFormField(
            obscureText: true,
            autocorrect: false,
            onChanged: (value) {},
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
              hintText: 'Ingrese Contraseña',
            ),
          ),
          const SizedBox(height: 80),
          MaterialButton(
            onPressed: () {
              loginUser('email', 'password');
            },
            color: const Color.fromRGBO(118, 183, 42, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 112.5, vertical: 12),
              child: const Text(
                'Iniciar Sesión',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
