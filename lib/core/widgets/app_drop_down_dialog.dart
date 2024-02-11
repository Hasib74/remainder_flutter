import 'package:filednote/core/theme/app_colors.dart';
import 'package:filednote/core/widgets/app_button_widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

showAppDropDownDialog<T>(BuildContext context, List<T> data,
    {String? addButtonTitle,
    VoidCallback? addButtonClick,
    bool? searchEnabled = true}) {
  return showDialog(
    context: context,
    builder: (context) {
      return _AppDropDownDialog<T>(
        data: data,
        addButtonTitle: addButtonTitle,
      );
    },
  );
}

class _AppDropDownDialog<T> extends StatelessWidget {
  List<T> data;

  String? addButtonTitle;

  VoidCallback? addButtonClick;

  bool? searchEnabled;

  _AppDropDownDialog(
      {super.key,
      required this.data,
      this.addButtonTitle,
      this.addButtonClick,
      this.searchEnabled});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(bottom: 16, top: 16),
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Visibility(
                  visible: searchEnabled ?? false,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SearchBar(
                      elevation: MaterialStateProperty.all(1),
                      trailing: [
                        Icon(
                          Icons.search,
                          color: AppColor.secondaryTextColor,
                        )
                      ],
                      hintText: 'Search',
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                  ),
                ),
                ListView.separated(
                  itemCount: data.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(
                    bottom: 16,
                  ),
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.pop(context, data[index]);
                      },
                      title: Text(data[index].toString()),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 1,
                      color: AppColor.secondaryTextColor,
                    );
                  },
                ),
                Visibility(
                  visible: addButtonClick != null,
                  child: AppButton(
                    title: addButtonTitle ?? 'Add',
                    onPressed: addButtonClick,
                    color: AppColor.primaryColor,
                    textColor: Colors.white,
                  ),
                ),
                Gap(16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
