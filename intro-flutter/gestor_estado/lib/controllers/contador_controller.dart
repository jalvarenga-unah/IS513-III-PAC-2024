import 'package:get/get.dart';

class ContadorController extends GetxController {
  //Reactividad
  final _contador = 10.obs; //Reactiva

  int get contador => _contador.value;
  set contador(int value) {
    if (value < 0) {
      _contador.value = 0;
      return;
    }
    _contador.value = value;
  }
}
