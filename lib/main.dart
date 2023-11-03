import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FormularioModalDemo(),
    );
  }
}

class Usuario {
  final String nombre;
  final String email;
  final String direccion;

  Usuario(this.nombre, this.email, this.direccion);
}

class FormularioModalDemo extends StatelessWidget {
  const FormularioModalDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ventana Modal'),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _mostrarVentanaModal(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.cyan,
          ),
          child: const Text('Abrir'),
        ),
      ),
    );
  }

  _mostrarVentanaModal(BuildContext context) {
    final List<Usuario> usuarios = [
      Usuario('Juan Pérez', 'juan@gmail.com', 'Santiago'),
      Usuario('María López', 'maria@gmail.com', 'Zacatecoluca'),
      Usuario('Carlos García', 'carlos@gmail.com', 'San vicente'),
      Usuario('Jose Gomez', 'jose@gmail.com', 'Ahuachapan'),
    ];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Consula datos del usuario'),
          backgroundColor: Colors.pink,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text('Seleccione un usuario del formulario:'),
              DropdownButton<Usuario>(
                items: usuarios.map((Usuario usuario) {
                  return DropdownMenuItem<Usuario>(
                    value: usuario,
                    child: Text(usuario.nombre),
                  );
                }).toList(),
                onChanged: (Usuario? selectedUser) {
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
                              Text('Dirección: ${selectedUser.direccion}'),
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
