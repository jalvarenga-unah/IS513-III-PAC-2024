import 'CuentaBancaria.dart';

void main() {
  final persona = CuentaBancaria(
    nombre: "Juan Alvarenga",
    numeroCuenta: 123123,
  );

  try {
    persona.saldo = -100;
  } catch (e) {
    print(e);
  }

  final persona2 = CuentaBancaria(
    nombre: "Enrique Rodas",
    numeroCuenta: 12312334,
    // saldo: 1000,
  );

  print(persona.nombre);
  print(persona.numeroCuenta);
  print(persona.saldo);
}
