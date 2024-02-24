import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:filednote/core/theme/app_colors.dart';
import 'package:filednote/features/disease/presentation/screen/sector/add_support.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';

import '../../../../core/utls/app_utls.dart';
import '../../../../core/widgets/app_button_widgets.dart';
import '../../../../core/widgets/app_text_filed.dart';
import '../../../crops/domain/model/crops_list_response_model.dart';
import '../../../crops/presentation/provider/crops_list_providers.dart';
import '../../domain/disease_model_for_view.dart';
import 'add_crops_for_multi_select_items.dart';

class AddDiseaseScreen extends ConsumerStatefulWidget {
  const AddDiseaseScreen({super.key});

  @override
  _AddDiseaseScreenState createState() => _AddDiseaseScreenState();
}

class _AddDiseaseScreenState extends ConsumerState<AddDiseaseScreen> {
  List<DiseaseModelForView> addDiseaseList = [];

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
            color: Colors.white,
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
            AppTextFiled(
              hint: "Name",
            ),
            AppUtils.mediumGap,
            Expanded(
              child: _expansionPanelList(),
            ),
            Visibility(
                visible: addDiseaseList.isEmpty,
                child: AppButton(
                  title: "Add Support",
                  onPressed: () {
                    setState(() {
                      addDiseaseList.add(DiseaseModelForView());
                    });
                  },
                )),
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
    );
  }

  _expansionPanelList() {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          print("Index: $index, isExpanded: $isExpanded");

          setState(() {
            addDiseaseList[index].setIsExpanded();
          });

          print(
              "addDiseaseList[index].isExpanded : ${addDiseaseList[index].isExpanded}");
        },
        children: addDiseaseList
            .map<ExpansionPanel>((e) => ExpansionPanel(
                  canTapOnHeader: true,
                  isExpanded: e.isExpanded ?? false,
                  headerBuilder: (context, isExpand) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text("Support Crops",
                              style: TextStyle(fontSize: 16)),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    padding: const EdgeInsets.all(0),
                                    onPressed: () {
                                      setState(() {
                                        addDiseaseList.removeAt(
                                            addDiseaseList.indexOf(e));
                                      });
                                    },
                                    icon: Container(
                                      margin: const EdgeInsets.only(left: 16),
                                      padding: const EdgeInsets.all(4),
                                      decoration: const BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(4),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Delete",
                                              style: TextStyle(
                                                  color: AppColor.whiteColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            Icon(
                                              Icons.delete,
                                              color: AppColor.whiteColor,
                                              size: 16,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                                const SizedBox(
                                  width: 5,
                                ),
                                Visibility(
                                  visible: addDiseaseList.indexOf(e) ==
                                      addDiseaseList.length - 1,
                                  child: IconButton(
                                      padding: const EdgeInsets.all(0),
                                      onPressed: () {
                                        setState(() {
                                          addDiseaseList
                                              .add(DiseaseModelForView());
                                        });
                                      },
                                      icon: Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: const BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(4),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              " Add",
                                              style: TextStyle(
                                                color: AppColor.whiteColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Icon(
                                              Icons.add,
                                              color: AppColor.whiteColor,
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  body: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: AddSupport(
                      ref: ref,
                      onSelectedCrops: (CropsModel model) {
                        setState(() {
                          addDiseaseList[addDiseaseList.indexOf(e)].crops =
                              model;
                        });
                      },
                      onSelectedFile: (File file) {
                        setState(() {
                          addDiseaseList[addDiseaseList.indexOf(e)].document =
                              file;
                        });
                      },
                      onSelectedFileName: (String name) {
                        setState(() {
                          addDiseaseList[addDiseaseList.indexOf(e)].fileName =
                              name;
                        });
                      },
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
/*
*
*   SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.5,
                child: ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      addDiseaseList[index].isExpanded = !isExpanded;
                    });
                  },
                  children: addDiseaseList
                      .map((e) => ExpansionPanel(
                          isExpanded: e.isExpanded,
                          headerBuilder: (context, isExpand) {
                            return Row(
                              children: [
                                ListTile(
                                  title: const Text("Crops"),
                                  trailing: addDiseaseList.indexOf(e) ==
                                          addDiseaseList.length
                                      ? InkWell(
                                          onTap: () {
                                            setState(() {
                                              addDiseaseList
                                                  .add(DiseaseModelForView());
                                            });
                                          },
                                          child: const Icon(Icons.add))
                                      : null,
                                ),
                              ],
                            );
                          },
                          body: AddSupport(
                            ref: ref,
                            onSelectedCrops: (CropsModel crops) {
                              addDiseaseList[addDiseaseList.indexOf(e)].crops =
                                  crops;
                            },
                            onSelectedFile: (File file) {
                              addDiseaseList[addDiseaseList.indexOf(e)].document =
                                  file;
                            },
                            onSelectedFileName: (String fileName) {
                              addDiseaseList[addDiseaseList.indexOf(e)].fileName =
                                  fileName;
                            },
                          )))
                      .toList(),
                ),
              ),
            ),
* */
