import 'package:flutter/material.dart';

import '../logica/armstrong_logica.dart';

class ArmstrongPantalla extends StatefulWidget {
  const ArmstrongPantalla({super.key});

  @override
  State<ArmstrongPantalla> createState() => ArmstrongPantallaState();
}

class ArmstrongPantallaState extends State<ArmstrongPantalla> {
  final controlador = TextEditingController();
  final logica = ArmstrongLogica();
  String? resultado;
  String? error;

  void calcular() {
    final numero = int.tryParse(controlador.text.trim());
    setState(() {
      if (numero == null || numero <= 0) {
        resultado = null;
        error = 'Ingresa un número entero positivo.';
      } else {
        error = null;
        resultado = logica.esArmstrong(numero)
            ? '$numero es un número Armstrong.'
            : '$numero no es un número Armstrong.';
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
      appBar: AppBar(title: const Text('Número Armstrong'), backgroundColor: Colors.deepPurple, foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Ingresa un número entero positivo', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            TextField(
              controller: controlador,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número', border: const OutlineInputBorder(), errorText: error),
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: calcular, child: const Text('Determinar')),
            if (resultado != null) ...[
              const SizedBox(height: 24),
              Text(resultado!, textAlign: TextAlign.center, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ],
        ),
      ),
    );
  }
}
