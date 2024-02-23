import 'package:filednote/core/mixin/state_mixin.dart';
import 'package:filednote/core/response/appResponse.dart';
import 'package:filednote/core/response/error.dart';
import 'package:filednote/core/snackbar/app_snack_bar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/repository/crops_repository.dart';
import '../../data/service/crops_service.dart';
import '../../domain/model/crops_list_response_model.dart';
import '../provider/crops_list_providers.dart';

class CropsController with StateMixin {
  final CropsRepository _cropsRepository = CropsService();

  TextEditingController cropsNameTextEditingController =
      new TextEditingController();

  TextEditingController scientificNameController = new TextEditingController();

  TextEditingController ipniCotroller = TextEditingController();

  var cropsAddFormState = GlobalKey<FormState>();

  @override
  dispose() {}

  @override
  initState(BuildContext context) {}

  getAllCrops(BuildContext context, WidgetRef ref) async {
    print("Get All Crops ....");
    Either<AppError, AppResponse> cropsRes =
        await _cropsRepository.getAllCrops();

    cropsRes.fold((l) {
      print(l.message);
    }, (r) {
      print(r.data);

      CropsListModel cropsListResponse = CropsListModel.fromJson(r.data);

      ProviderContainer container = ProviderContainer();
      container
          .read(cropsListProvider.notifier)
          .setCropsList(cropsListResponse);

      ref.read(cropsListProvider.notifier).setCropsList(cropsListResponse);
    });
  }

  addCrops(BuildContext context, WidgetRef ref) async {
    cropsAddFormState.currentState?.save();

    if (cropsAddFormState.currentState?.validate() ?? false) {
      Map<String, String> _body = {
        "name": cropsNameTextEditingController.value.text,
        "scientific_name": scientificNameController.value.text,
        "ipni": ipniCotroller.value.text
      };

      EasyLoading.show();

      Either<AppError, AppResponse> cropsRes =
          await _cropsRepository.addCrop(_body);

      EasyLoading.dismiss();

      if (cropsRes.isRight()) {
        AppSnackBar.showSuccessSnackBar(
            context: context, message: "Successfully added crops.");

        await getAllCrops(context, ref);

        Navigator.pop(context);
      }
    }
  }

  void deleteCrops(BuildContext context, WidgetRef ref, String? id) async {
    var request = {
      "crop_id": id,
    };

    EasyLoading.show();

    Either<AppError, AppResponse> cropsRes =
        await _cropsRepository.deleteCrop(request);

    EasyLoading.dismiss();

    if (cropsRes.isRight()) {
      AppSnackBar.showSuccessSnackBar(
          context: context, message: "Crops deleted successfully");

      getAllCrops(context, ref);
    }
  }
}
