import 'package:get/get.dart';
import 'package:test_app_omni_doc/app/data/models/play_list_model.dart';
import 'package:test_app_omni_doc/app/data/provider/play_list_provider.dart';

class PlayListController extends GetxController with StateMixin {
  PlayListController() {
    getPlayLists();
  }

  PlayListModel? playLists;

  getPlayLists() async {
    playLists = await PlayList().getPlayList();
    change(null, status: RxStatus.success());
  }
}
