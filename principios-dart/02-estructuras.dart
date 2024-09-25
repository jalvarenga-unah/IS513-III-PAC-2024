void main() {
  // Listas
  final List<int> lista = [1, 2, 3, 4, 5];
  // final copiaLista = lista; // creando una variable con la misma referencia

  // desestructuración
  final copiaLista = [...lista]; //spread operator

  // final a = lista[0];
  // final b = lista[1];
  // final c = lista[2];

  // rest operator
  final [a, b, c, ...otros] = lista;

  print(a);
  print(b);
  print(c);
  print(otros);

  // lista = []; ❌ No se puede reasignar una lista

  lista.add(6); // agregar un elemento al final
  print(lista);

  lista.remove(2); // elimina el valor enviado
  print(lista);
  lista.removeAt(0); // elimina el valor en la posición enviada
  print(lista);

  for (int i = 0; i < lista.length; i++) {
    print(lista[i]);
  }

  lista.clear(); // elimina todos los elementos
  print('original');
  print(lista);
  print('copia');
  print(copiaLista);
}
