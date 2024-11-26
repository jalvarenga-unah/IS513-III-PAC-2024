import 'package:get/get.dart';

class ContadorController extends GetxController {
  //Reactividad
  final _contador = 10.obs; //Reactiva/observable
  final currentIndex = 0.obs;
  final _numeros = [1, 2, 3, 7, 8, 9].obs;

  //TODO: investigar porque causa conflico la firma en los get/set
  List<int> get numeros => _numeros.toList();

  void addNum(int value) {
    _numeros.add(value);
  }

  void deleteNumber(int position) {
    _numeros.removeAt(position);
  }

  int get contador => _contador.value;
  set contador(int value) {
    if (value < 0) {
      _contador.value = 0;
      return;
    }
    _contador.value = value;
  }
}
