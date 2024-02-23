import 'dart:io';

import 'package:filednote/features/crops/domain/model/crops_list_response_model.dart';

class DiseaseModelForView {
  CropsModel? crops;
  File? document;
  String? fileName;

  bool isExpanded = true;
}
