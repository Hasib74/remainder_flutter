import 'package:filednote/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

showAppDropDownDialog<T>(BuildContext context, List<T> data) {
  return showDialog(
    context: context,
    builder: (context) {
      return _AppDropDownDialog<T>(data: data);
    },
  );
}

class _AppDropDownDialog<T> extends StatelessWidget {
  List<T> data;

  _AppDropDownDialog({super.key, required this.data});

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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
