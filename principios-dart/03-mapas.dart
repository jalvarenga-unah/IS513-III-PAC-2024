void main() {
  //mapas -> clave: valor

  final Map<String, dynamic> persona = {
    'nombre': 'Juan',
    'edad': 20,
    'soltero': true,
    'hijos': ['Pedro', 'Pablo', 'Maria'],
    'direccion': {
      'calle': 'Calle 13',
      'numero': 123,
      'geo': {'lat': 1323.123, 'lng': 123.123}
    }
  };

  persona['nombre'] = 'Pedro';
  persona['apellido'] = 'Perez'; //agregar un nuevo valor
  print(persona);
  print(persona['nombre']);
  print(persona['Edad']);

  print(persona['direccion']['geo']['lat']);
  print(persona['direccion']['geo']['lng']);
}
