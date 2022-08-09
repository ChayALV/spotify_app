// ignore_for_file: library_prefixes

import 'package:get/get.dart';
import 'package:test_app_omni_doc/app/data/models/artist_model.dart';
import 'package:test_app_omni_doc/app/data/provider/albums_of_artist_provider.dart';
import 'package:test_app_omni_doc/app/data/provider/artist_provider.dart';
import 'package:test_app_omni_doc/app/data/models/albums_of_artist_model.dart'
    as albumsOfArtist;

class ArtistController extends GetxController with StateMixin {
  final String idArtist;
  ArtistController(this.idArtist) {
    getArtist(idArtist);
  }

  ArtistModel? artist;
  albumsOfArtist.AlbumsOfArtistModel? albums;

  getArtist(String id) async {
    artist = await Artist().getArtistById(id);
    await getAlbumsOfArtist(id);
  }

  getAlbumsOfArtist(String id) async {
    albums = await AlbumsOfArtist().getAlbumsByIdArtist(id);
    change(null, status: RxStatus.success());
  }
}
