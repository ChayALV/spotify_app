import 'package:get/get.dart';
import 'package:test_app_omni_doc/app/data/models/search_model.dart';
import 'package:test_app_omni_doc/app/data/provider/search_provider.dart';

class SearchController extends GetxController with StateMixin{
  SearchModel? results;

  getResultsOfSearch(String search) async {
    try {
      change(null, status: RxStatus.loading());
      results = await Search().getResults(search);
      change(null, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.loading());
    }
  }
}
