import 'package:flutter/material.dart';

import '../logica/fibonacci_logica.dart';

class FibonacciPantalla extends StatefulWidget {
  const FibonacciPantalla({super.key});

  @override
  State<FibonacciPantalla> createState() => FibonacciPantallaState();
}

class FibonacciPantallaState extends State<FibonacciPantalla> {
  final controlador = TextEditingController();
  final logica = FibonacciLogica();
  List<int>? terminos;
  String? error;

  void generar() {
    final cantidad = int.tryParse(controlador.text.trim());
    setState(() {
      if (cantidad == null || cantidad <= 0) {
        terminos = null;
        error = 'Ingresa una cantidad entera positiva.';
      } else if (cantidad > 100) {
        terminos = null;
        error = 'Ingresa una cantidad entre 1 y 100.';
      } else {
        error = null;
        terminos = logica.generar(cantidad);
      }
    });
  }

  @override
  void dispose() {
    controlador.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Serie de Fibonacci'), backgroundColor: Colors.green),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Ingresa la cantidad de términos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            TextField(
              controller: controlador,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Cantidad N', border: const OutlineInputBorder(), errorText: error),
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: generar, child: const Text('Generar serie')),
            if (terminos != null) ...[
              const SizedBox(height: 24),
              const Text('Términos generados:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(terminos!.join(', '), style: const TextStyle(fontSize: 18)),
            ],
          ],
        ),
      ),
    );
  }
}
