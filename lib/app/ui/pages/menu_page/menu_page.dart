// ignore_for_file: deprecated_member_use

import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:test_app_omni_doc/app/controllers/home_controller.dart';
import 'package:test_app_omni_doc/app/controllers/menu_controller.dart';
import 'package:test_app_omni_doc/app/controllers/play_list_controller.dart';
import 'package:test_app_omni_doc/app/controllers/search_controller.dart';
import 'package:test_app_omni_doc/app/ui/pages/home_page/home_page.dart';
import 'package:test_app_omni_doc/app/ui/pages/play_list_page/play_list_page.dart';
import 'package:test_app_omni_doc/app/ui/pages/search_page/search_page.dart';

class MenuPage extends GetView<MenuController> {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put( HomeController() );
    Get.put( SearchController() );
    Get.put( PlayListController() );
    return GetBuilder<MenuController>(
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,  
        body: Stack(
          children: [
            PageView(
              controller: controller.pageController,
              onPageChanged: (index)=>controller.changeValue(index),
              children: const [
                HomePage(),
                SearchPage(),
                PlayListPage(),
              ],
            ),
            Column(
              children: [
                const Spacer(),
                Obx(
                  ()=>DotNavigationBar(
                    unselectedItemColor: Colors.white,
                    selectedItemColor: Colors.greenAccent.shade400,
                    backgroundColor: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15,
                        color: Colors.grey.shade800,
                        offset: const Offset(-4, -4),
                        spreadRadius: 1),
                      const BoxShadow(
                        blurRadius: 15,
                        color: Colors.black87,
                        offset: Offset(4, 4),
                        spreadRadius: 1),
                    ],
                    currentIndex: controller.index.value,
                    onTap: (index)=>controller.changeValue(index),
                    items: [
                      /// Home
                      DotNavigationBarItem(
                        icon: const Icon(FontAwesomeIcons.home),
                      ),

                      /// Search
                      DotNavigationBarItem(
                        icon: const Icon(FontAwesomeIcons.search),
                      ),

                      /// Likes
                      DotNavigationBarItem(
                        icon: const Icon(FontAwesomeIcons.list),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),

        // bottomNavigationBar: 
      )
    );
  }
}
