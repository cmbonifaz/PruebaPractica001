class FibonacciLogica {
  List<int> generar(int cantidad) {
    final terminos = <int>[];
    var anterior = 0;
    var actual = 1;

    for (var posicion = 0; posicion < cantidad; posicion++) {
      terminos.add(anterior);
      final siguiente = anterior + actual;
      anterior = actual;
      actual = siguiente;
    }
    return terminos;
  }
}
