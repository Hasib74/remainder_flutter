import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class CropListScreen extends StatelessWidget {
  CropListScreen({super.key});

  List<String> _cropsList = [
    "Barley",
    "Sorghum",
    "Millet",
    "Oats",
    "Rye",
    "Soybeans",
    "Peanuts (Groundnuts)",
    "Sunflower",
    "Cotton",
    "Sugarcane",
    "Sugar beet",
    "Potatoes",
    "Sweet potatoes",
    "Cassava",
    "Yams",
    "Taro",
    "Plantains",
    "Bananas",
    "Apples",
    "Oranges",
    "Grapes",
    "Mangoes",
    "Pineapples",
    "Papayas",
    "Coconuts",
    "Coffee",
    "Tea",
    "Cocoa (cacao)",
    "Tobacco",
    "Tomatoes",
    "Carrots",
    "Onions",
    "Cabbage",
    "Lettuce",
    "Spinach",
    "Broccoli",
    "Cauliflower"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const Text(
            "Crops List",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBar(
              elevation: MaterialStateProperty.all(1),
              trailing: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.search,
                    color: AppColor.secondaryTextColor,
                  ),
                )
              ],
              hintText: 'Search',
              onChanged: (value) {
                print(value);
              },
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, int index) {
                  return ListTile(
                    title: Text(_cropsList[index]),
                  );
                },
                separatorBuilder: (context, int index) {
                  return const Divider();
                },
                itemCount: _cropsList.length),
          ),



        ],
      ),
    ));
  }
}
