import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';

import '../../../../../core/utls/app_utls.dart';
import '../../../../../core/widgets/app_text_filed.dart';
import '../../../../crops/presentation/provider/crops_list_providers.dart';

class AddSupport extends StatefulWidget {
  WidgetRef ref;

  AddSupport({super.key, required this.ref});

  @override
  State<AddSupport> createState() => _AddSupportState();
}

class _AddSupportState extends State<AddSupport> {
  TextEditingController nameTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
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
          onChanged: print,
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
          },
          typeSelectors: const [
            TypeSelector(
              type: FileType.any,
              selector: Row(
                children: <Widget>[
                  Icon(
                    Icons.add_circle,
                    color: Colors.black,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text("Add documents",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
        AppUtils.mediumGap,
        Visibility(
          visible: nameTextEditingController.value.text.isNotEmpty,
          child: AppTextFiled(
            controller: nameTextEditingController,
          ),
        ),
      ],
    );
  }
}
