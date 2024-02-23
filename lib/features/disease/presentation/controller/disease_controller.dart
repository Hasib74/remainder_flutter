import 'package:filednote/core/response/appResponse.dart';
import 'package:filednote/core/response/error.dart';
import 'package:filednote/core/snackbar/app_snack_bar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/repository/disease_repository.dart';
import '../../data/service/disease_servicce.dart';
import '../../domain/disease_model.dart';
import '../provider/disease_provider.dart';

class DiseaseController {
  DiseaseRepository diseaseRepository = DiseaseService();

  Future getAllDisease(BuildContext context, WidgetRef ref) async {
    Either<AppError, AppResponse> response =
        await diseaseRepository.getAllDisease();

    response.fold((l) {
      AppSnackBar.showErrorSnackBar(context: context, message: l.message ?? "");
    }, (r) {
      DiseaseListModel diseaseListModel = DiseaseListModel.fromJson(r.data);
      ref.read(diseaseListProvider.notifier).setDiseaseList(diseaseListModel);
    });
  }
}
