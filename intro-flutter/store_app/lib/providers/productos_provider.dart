import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/models/producto.dart';

class ProductosProvider {
  getProducts() {
    // final Uri url = Uri.https('fakestoreapi.com', '/products');
    final Uri url = Uri.parse('https://fakestoreapi.com/products');

    print('Haciendo cosas');
    http.get(url).then((response) {
      if (response.statusCode == 200) {
        print(response.body);
      }
    }).catchError((error) {
      print(error);
    });

    print('Hacer otras cosas');
  }

  Future<List<Producto>> getProductsAsync() async {
    // final Uri url = Uri.https('fakestoreapi.com', '/products');
    final Uri url = Uri.parse('https://fakestoreapi.com/products');

    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception("Error al obtener los productos");
      }
      // List<dynamic>
      // final data = json.decode(response.body).cast<Map<dynamic, dynamic>>();
      final data = List<Producto>.from(
        json.decode(response.body).map((prod) => Producto.fromJson(prod)),
      );

      print(data);

      return data;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
