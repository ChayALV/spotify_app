import 'package:get/get.dart';
import 'package:test_app_omni_doc/app/data/models/album_model.dart';
import 'package:test_app_omni_doc/app/data/provider/album_provider.dart';

class AlbumController extends GetxController with StateMixin{
  final String albumId;
  AlbumController(this.albumId) {
    getAlbum();
  }

  AlbumModel? album;

  getAlbum() async {
    album = await Album().getAlbumById(albumId);
    change(null, status: RxStatus.success());
  }
}
