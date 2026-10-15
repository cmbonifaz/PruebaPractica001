class PerfectoLogica {
  bool esPerfecto(int numero) {
    if (numero <= 1) {
      return false;
    }

    var suma = 1;
    for (var divisor = 2; divisor * divisor <= numero; divisor++) {
      if (numero % divisor == 0) {
        suma += divisor;
        final divisorPareja = numero ~/ divisor;
        if (divisorPareja != divisor) {
          suma += divisorPareja;
        }
      }
    }
    return suma == numero;
  }
}
