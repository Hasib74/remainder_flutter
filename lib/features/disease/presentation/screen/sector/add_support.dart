import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:filednote/core/theme/app_colors.dart';
import 'package:filednote/features/crops/domain/model/crops_list_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';

import '../../../../../core/utls/app_utls.dart';
import '../../../../../core/widgets/app_text_filed.dart';
import '../../../../crops/presentation/provider/crops_list_providers.dart';

class AddSupport extends StatefulWidget {
  WidgetRef ref;

  Function(CropsModel)? onSelectedCrops;
  Function(File)? onSelectedFile;
  Function(String)? onSelectedFileName;

  AddSupport(
      {super.key,
      required this.ref,
      required this.onSelectedCrops,
      required this.onSelectedFile,
      required this.onSelectedFileName});

  @override
  State<AddSupport> createState() => _AddSupportState();
}

class _AddSupportState extends State<AddSupport> {
  TextEditingController nameTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        child: Column(
          children: [
            DropdownSearch<String?>(
              items: widget.ref
                      .watch(cropsListProvider)
                      .cropsList
                      ?.map((e) => e.name)
                      .toList() ??
                  [],
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Crops",
                  hintText: "Please Select Crops",
                ),
              ),
              onChanged: (value) {
                CropsModel cropsModel = widget.ref
                    .watch(cropsListProvider)
                    .cropsList!
                    .firstWhere((element) => element.name == value);

                widget.onSelectedCrops!(cropsModel);
              },
              selectedItem: "",
            ),
            AppUtils.mediumGap,
            FormBuilderFilePicker(
              name: "File",
              decoration: const InputDecoration(
                labelText: "Attachments",
              ),
              maxFiles: null,
              previewImages: true,
              onChanged: (val) {
                print("On change ===> ${val}");

                setState(() {
                  nameTextEditingController.text = val![0].name;
                });

                widget.onSelectedFile!(File((val![0].path ?? "")));
              },
              typeSelectors: [
                TypeSelector(
                  type: FileType.any,
                  selector: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.add_circle,
                          color: AppColor.secondaryTextColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text("Add documents",
                              style: TextStyle(
                                color: AppColor.primaryTextColor,
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            AppUtils.mediumGap,
            Visibility(
              visible: nameTextEditingController.value.text.isNotEmpty,
              child: AppTextFiled(
                controller: nameTextEditingController,
                onChanged: (val) {
                  widget.onSelectedFileName!(val);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
