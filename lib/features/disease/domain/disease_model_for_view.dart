import 'dart:io';

import 'package:filednote/features/crops/domain/model/crops_list_response_model.dart';

class DiseaseModelForView {
  CropsModel? crops;
  File? document;
  String? fileName;

  bool? isExpanded = false ;

  setIsExpanded() {
    print("Before isExpanded : $isExpanded");
    isExpanded = !isExpanded! ;

    print("After isExpanded : $isExpanded");
  }

  DiseaseModelForView(
      {this.crops, this.document, this.fileName, this.isExpanded = false});
}
