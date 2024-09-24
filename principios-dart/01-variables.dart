void main() {
  print('Hola mundo');

  // variables

  // especificando el tipo de datos
  String nombre = 'Juan'; // es un iterable
  int edad = 10;
  bool esMayor = false;

  //Infiera el tipo de datos
  // final es una constante, que permite la inicialización, posterior
  // a la declaración
  final String apellido;
  apellido = 'Rodas';

  // es una variable inmutable
  const String dni = 'abc123';

  String? apodo = null;
  apodo = 'otra cosa';

  print(nombre.length);
  print(nombre[0]);
  print(nombre.split("").reversed.toList().join());
}
