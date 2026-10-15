import 'package:flutter/material.dart';

import '../logica/perfecto_logica.dart';

class PerfectoPantalla extends StatefulWidget {
  const PerfectoPantalla({super.key});

  @override
  State<PerfectoPantalla> createState() => PerfectoPantallaState();
}

class PerfectoPantallaState extends State<PerfectoPantalla> {
  final controlador = TextEditingController();
  final logica = PerfectoLogica();
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
        resultado = logica.esPerfecto(numero)
            ? '$numero es un número perfecto.'
            : '$numero no es un número perfecto.';
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
    return PantallaNumero(
      titulo: 'Número perfecto',
      instruccion: 'Ingresa un número entero positivo',
      controlador: controlador,
      error: error,
      resultado: resultado,
      boton: 'Determinar',
      onPressed: calcular,
    );
  }
}

class PantallaNumero extends StatelessWidget {
  const PantallaNumero({
    super.key,
    required this.titulo,
    required this.instruccion,
    required this.controlador,
    required this.error,
    required this.resultado,
    required this.boton,
    required this.onPressed,
  });

  final String titulo;
  final String instruccion;
  final TextEditingController controlador;
  final String? error;
  final String? resultado;
  final String boton;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titulo), backgroundColor: Colors.blue),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(instruccion, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            TextField(
              controller: controlador,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Número',
                border: const OutlineInputBorder(),
                errorText: error,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: onPressed, child: Text(boton)),
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
