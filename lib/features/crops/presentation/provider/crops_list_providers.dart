import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/model/crops_list_response_model.dart';

// crops will be the provider name

var cropsListProvider =
    StateNotifierProvider<CropsListProvider, CropsListModel>((ref) {
  return CropsListProvider(CropsListModel());
});

class CropsListProvider extends StateNotifier<CropsListModel> {
  CropsListProvider(CropsListModel state) : super(state);

  void setCropsList(CropsListModel cropsListResponse) {
    state = cropsListResponse;
  }
}
