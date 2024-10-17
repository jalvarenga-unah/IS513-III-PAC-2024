class CuentaBancaria {
  final String nombre;
  final int numeroCuenta;
  // para que sea privado se le agrega el guion bajo
  // late double _saldo; // solo se puede acceder a el desde la misma clase
  double _saldo = 0; // solo se puede acceder a el desde la misma clase

  // CuentaBancaria({
  //   required this.nombre,
  //   required this.numeroCuenta,
  // });

  CuentaBancaria({
    required this.nombre,
    required this.numeroCuenta,
    // this._saldo = 0,
  });

  double get saldo => _saldo; // retorna el saldo (valor de la propiedad)
  set saldo(double saldo) {
    if (saldo < 0) {
      throw ('EL saldo no puede ser negativo');
    }

    _saldo = saldo;
  }

  // double getSaldo() {
  //   return _saldo;
  // }
  // void setSaldo(double saldo) {
  //   if (saldo < 0) {
  //     throw ("No se puede tener saldo negativo");
  //   }
  //   _saldo = saldo;
  // }
}
