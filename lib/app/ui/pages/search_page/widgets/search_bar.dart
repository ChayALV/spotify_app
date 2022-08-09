import 'package:flutter/material.dart';
import 'package:test_app_omni_doc/app/controllers/search_controller.dart';
import 'package:test_app_omni_doc/app/ui/global_widgets/container_neumorphism.dart';
import 'package:test_app_omni_doc/app/ui/utils/media_query.dart';

class SearchBar extends StatelessWidget {
  final SearchController controller;
  const SearchBar({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerNeuPhis(
      width: displayWidth(context) * 0.85,
      height: 70,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: TextFormField(
                onChanged: (text) => controller.getResultsOfSearch(text),
                style: const TextStyle(fontFamily: 'Montserrat'),
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: 'Search'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
