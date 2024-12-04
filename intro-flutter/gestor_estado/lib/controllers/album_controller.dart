import 'package:gestor_estado/models/album.dart';
import 'package:get/get.dart';

class AlbumController extends GetxController {
  final RxList<Album> _albums = <Album>[].obs;

  void getAlbumes() {}
}
