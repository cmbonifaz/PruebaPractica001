class ArmstrongLogica {
  bool esArmstrong(int numero) {
    final cifras = numero.toString().split('');
    final cantidadCifras = cifras.length;
    final suma = cifras.fold<int>(
      0,
      (total, cifra) => total + potencia(int.parse(cifra), cantidadCifras),
    );
    return suma == numero;
  }

  int potencia(int base, int exponente) {
    var resultado = 1;
    for (var i = 0; i < exponente; i++) {
      resultado *= base;
    }
    return resultado;
  }
}
