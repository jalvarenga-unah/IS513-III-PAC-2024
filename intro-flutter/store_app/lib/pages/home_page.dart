import 'package:flutter/material.dart';
import 'package:store_app/providers/productos_provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final productosProvider = ProductosProvider();

  @override
  Widget build(BuildContext context) {
    productosProvider.getProductsAsync();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}
