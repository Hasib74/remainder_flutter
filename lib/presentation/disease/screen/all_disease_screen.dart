import 'package:filednote/core/widgets/app_text_filed.dart';
import 'package:flutter/material.dart';

class AllDiseaseScreen extends StatelessWidget {
  AllDiseaseScreen({super.key});

  List<String> diseaseList = [
    "Late Blight",
    "Early Blight",
    "Powdery Mildew",
    "Downy Mildew",
    "Fusarium Wilt",
    "Verticillium Wilt",
    "Bacterial Wilt",
    "Bacterial Spot",
    "Bacterial Canker",
    "Bacterial Speck",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Disease"),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            // color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(diseaseList[index]),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                  itemCount: diseaseList.length),
            ),
          ],
        ),
      ),
    );
  }
}
