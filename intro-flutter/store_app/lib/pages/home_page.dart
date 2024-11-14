import 'package:flutter/material.dart';
import 'package:store_app/providers/productos_provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final productosProvider = ProductosProvider();

  @override
  Widget build(BuildContext context) {
    // final productos = productosProvider.getProductsAsync();
    // print(productos);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: FutureBuilder(
        future: productosProvider.getProductsAsync(),
        builder: (contex, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text('Error al obtener los productos'),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: Text('No hay productos'),
            );
          }

          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final producto = snapshot.data![index];

                return ListTile(
                  title: Text(producto['title']),
                  subtitle: Text(producto['description']),
                );
              });
        },
      ),
    );
  }
}
