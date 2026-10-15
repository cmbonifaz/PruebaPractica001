import 'package:flutter/material.dart';

import 'pantallas/armstrong_pantalla.dart';
import 'pantallas/fibonacci_pantalla.dart';
import 'pantallas/inicio_pantalla.dart';
import 'pantallas/perfecto_pantalla.dart';

class EjercicioInfo {
  final String id;
  final String titulo;
  final String descripcion;
  final String ruta;
  final IconData icono;
  final Color color;
  final WidgetBuilder pantalla;

  const EjercicioInfo({
    required this.id,
    required this.titulo,
    required this.descripcion,
    required this.ruta,
    required this.icono,
    required this.color,
    required this.pantalla,
  });
}

final List<EjercicioInfo> ejercicios = [
  EjercicioInfo(
    id: '4',
    titulo: 'Número perfecto',
    descripcion: 'Verifica si la suma de sus divisores propios es igual al número.',
    ruta: '/ej04',
    icono: Icons.calculate_outlined,
    color: Colors.blue,
    pantalla: (_) => const PerfectoPantalla(),
  ),
  EjercicioInfo(
    id: '5',
    titulo: 'Serie de Fibonacci',
    descripcion: 'Genera los primeros N términos de la serie de Fibonacci.',
    ruta: '/ej05',
    icono: Icons.format_list_numbered,
    color: Colors.green,
    pantalla: (_) => const FibonacciPantalla(),
  ),
  EjercicioInfo(
    id: '6',
    titulo: 'Número Armstrong',
    descripcion: 'Comprueba si la suma de sus dígitos elevados es el número original.',
    ruta: '/ej06',
    icono: Icons.auto_awesome,
    color: Colors.deepPurple,
    pantalla: (_) => const ArmstrongPantalla(),
  ),
];

final Map<String, WidgetBuilder> rutas = {
  for (final ejercicio in ejercicios) ejercicio.ruta: ejercicio.pantalla,
};

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba práctica',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const InicioPantalla(),
      routes: rutas,
    );
  }
}
