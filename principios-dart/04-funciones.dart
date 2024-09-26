void main() {
  //ejecución de una función
  salduar("Juan", "Alvarenga");
  salduar("Perez", "Juan");

  saludo(apellido: 'Perez', nombre: 'Pedro');

  final resultado = transformar('Juan', 30, esMayor: true);
  print(resultado);

  // salduar(1234);
  // salduar([]);
}

void salduar(String nombre, String apellido) {
  // template string
  // print('Hola '+nombre+'!!');
  print('Hola ${nombre} $apellido!!');
}

// void saludo({String? nombre, String? apellido}) {
//   print(
//       'Hola ${nombre ?? 'NO tiene nombre'} ${apellido ?? 'No tiene apellido'}!!');
// }

void saludo({required String nombre, required String apellido}) {
  print('Hola ${nombre} ${apellido}!!');
}

//* Para que el argumento sea opcional se debe de poner entre llaves y se convierte en un argumento con nombre

//? Para que el argumento sea posicional y opcional se debe de poner entre corchetes
//? y se debe de poner un valor por defecto o permitir que sea nulo
Map<String, String> transformar(String nombre, int edad, {bool? esMayor}) {
  return {
    'nombre': nombre,
    // 'edad': edad.toString(),
    'edad': '$edad',
    'esMayor': esMayor ? 'Si' : 'No',
  };
}
