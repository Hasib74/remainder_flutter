import 'package:filednote/presentation/disease/domain/disease_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var diseaseListProvider =
StateNotifierProvider<DiseaseListProvider, DiseaseListModel>((ref) {
  return DiseaseListProvider(DiseaseListModel());
});

class DiseaseListProvider extends StateNotifier<DiseaseListModel> {
  DiseaseListProvider(DiseaseListModel state) : super(state);

  void setDiseaseList(DiseaseListModel cropsListResponse) {
    state = cropsListResponse;
  }
}

