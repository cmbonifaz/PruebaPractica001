import 'package:flutter/material.dart';

import '../main.dart';

class InicioPantalla extends StatelessWidget {
  const InicioPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba práctica'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Icon(Icons.functions, size: 72, color: Colors.blue),
          const SizedBox(height: 8),
          const Text(
            'Ejercicios de números',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Selecciona un ejercicio para comenzar',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 20),
          ...ejercicios.map(
            (ejercicio) => Card(
              color: ejercicio.color.withAlpha(25),
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: CircleAvatar(
                  backgroundColor: ejercicio.color,
                  foregroundColor: Colors.white,
                  child: Icon(ejercicio.icono),
                ),
                title: Text(
                  'Ejercicio ${ejercicio.id}: ${ejercicio.titulo}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(ejercicio.descripcion),
                trailing: Icon(Icons.chevron_right, color: ejercicio.color),
                onTap: () => Navigator.pushNamed(context, ejercicio.ruta),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
