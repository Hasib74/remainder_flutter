import 'package:dropdown_search/dropdown_search.dart';
import 'package:filednote/presentation/disease/presentation/screen/sector/add_support.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';

import '../../../../core/utls/app_utls.dart';
import '../../../../core/widgets/app_button_widgets.dart';
import '../../../../core/widgets/app_text_filed.dart';
import '../../../crops/presentation/provider/crops_list_providers.dart';
import 'add_crops_for_multi_select_items.dart';

class AddDiseaseScreen extends ConsumerStatefulWidget {
  const AddDiseaseScreen({super.key});

  @override
  _AddDiseaseScreenState createState() => _AddDiseaseScreenState();
}

class _AddDiseaseScreenState extends ConsumerState<AddDiseaseScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String? fileName;

  int cropItems = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Disease"),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppTextFiled(
                hint: "Name",
              ),
              AppUtils.mediumGap,
              ExpansionPanelList(
                children: [
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return const ListTile(
                        title: Text("Crops"),
                      );
                    },
                    body: AddSupport(
                      ref: ref,
                    ),
                    isExpanded: cropItems == 1,
                  ),
                ],
              ),
              AppUtils.mediumGap,
              ExpansionPanelList(
                children: [
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return const ListTile(
                        title: Text("Crops 1"),
                      );
                    },
                    body: AddSupport(
                      ref: ref,
                    ),
                    isExpanded: cropItems == 1,
                  ),
                ],
              ),
              AppUtils.mediumGap,
              AppButton(
                title: "Add Disease",
                onPressed: () {
                  // context.goNamed(AppRoutes.addExp);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
