import 'package:http/http.dart' as http;

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

  getProductsAsync() async {
    // final Uri url = Uri.https('fakestoreapi.com', '/products');
    final Uri url = Uri.parse('https://fakestoreapi.com/products');

    print('Haciendo cosas');
    final response = await http.get(url);
    print(response.body);
    print('Hacer otras cosas');
  }
}
