import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FormularioModalDemo(),
    );
  }
}

class Usuario {
  final String nombre;
  final String email;

  Usuario(this.nombre, this.email);
}

class FormularioModalDemo extends StatelessWidget {
  const FormularioModalDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proyecto Ventana Modal'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _mostrarVentanaModal(context);
          },
          child: const Text('Abrir Ventana Modal'),
        ),
      ),
    );
  }

  _mostrarVentanaModal(BuildContext context) {
    final List<Usuario> usuarios = [
      Usuario('Juan Pérez', 'juan@egmail.com'),
      Usuario('María López', 'maria@gmail.com'),
      Usuario('Carlos García', 'carlos@gmail.com'),
      Usuario('Jose Gomez', 'jose@gmail.com'),
    ];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Consulta de Datos'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text('Seleccione un usuario:'),
              DropdownButton<Usuario>(
                items: usuarios.map((Usuario usuario) {
                  return DropdownMenuItem<Usuario>(
                    value: usuario,
                    child: Text(usuario.nombre),
                  );
                }).toList(),
                onChanged: (Usuario? selectedUser) {
                  // Aquí puedes mostrar los detalles del usuario seleccionado
                  if (selectedUser != null) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Detalles del Usuario'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text('Nombre: ${selectedUser.nombre}'),
                              Text('Correo Electrónico: ${selectedUser.email}'),
                            ],
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Cerrar'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
