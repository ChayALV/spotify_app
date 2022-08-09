import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  var index = 0.obs;

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  changeValue(int indexPage) {
    index.value = indexPage;
    pageController.animateToPage(indexPage,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
}
