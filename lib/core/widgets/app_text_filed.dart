import 'package:filednote/core/theme/app_colors.dart';
import 'package:filednote/core/widgets/app_drop_down_dialog.dart';
import 'package:flutter/material.dart';

import '../packages/app_multi_select_form_field.dart';

class AppTextFiled<T> extends StatelessWidget {
  String? hint;

  // String? label;
  String? errorText;
  bool? isPassword;
  TextEditingController? controller;
  TextInputType? textInputType;
  TextInputAction? textInputAction;
  FocusNode? focusNode;
  Function? onFieldSubmitted;
  Function? onChanged;
  Function? onEditingComplete;
  Function? onTap;
  Function? onSaved;
  final String? Function(String?)? validator;
  int? maxLines;
  int? minLines;
  bool? enabled;
  bool? readOnly;
  bool? obscureText;
  bool? autofocus;
  bool? autocorrect;
  bool? enableSuggestions;
  bool? showCursor;
  bool? maxLengthEnforced;
  int? maxLength;
  double? cursorWidth;
  double? cursorHeight;
  Radius? cursorRadius;
  Color? cursorColor;
  List<T>? menus;
  IconData? suffixIcon;
  Function(T)? onSelectedItem;
  String? addButtonTitle;
  VoidCallback? onAddButtonClick;
  bool? isMultiSelect;

  AppTextFiled(
      {super.key,
      this.hint,
      // this.label,
      this.errorText,
      this.isPassword,
      this.controller,
      this.textInputType,
      this.textInputAction,
      this.focusNode,
      this.onFieldSubmitted,
      this.onChanged,
      this.onEditingComplete,
      this.onTap,
      this.onSaved,
      this.validator,
      this.maxLines,
      this.minLines,
      this.enabled,
      this.readOnly,
      this.obscureText,
      this.autofocus,
      this.autocorrect,
      this.enableSuggestions,
      this.showCursor,
      this.maxLengthEnforced,
      this.maxLength,
      this.cursorWidth,
      this.cursorHeight,
      this.cursorRadius,
      this.cursorColor,
      this.menus,
      this.suffixIcon,
      this.onSelectedItem,
      this.addButtonTitle,
      this.onAddButtonClick,
      this.isMultiSelect = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (menus != null) {
          T? data = await showAppDropDownDialog<T>(context, menus ?? [],
              addButtonTitle: addButtonTitle, addButtonClick: onAddButtonClick);

          if (data != null) {
            onSelectedItem!(data);
          }
        }
      },
      child: isMultiSelect == true
          ? _multiSelect()
          : TextFormField(
              obscureText: obscureText ?? false,
              controller: controller,
              keyboardType: textInputType,
              textInputAction: textInputAction,
              focusNode: focusNode,
              onChanged: onChanged as void Function(String)?,
              onEditingComplete: onEditingComplete as void Function()?,
              onTap: onTap as void Function()?,
              validator: validator,
              maxLines: obscureText == true ? 1 : maxLines,
              minLines: minLines,
              enabled: enabled,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: AppColor.primaryTextColor,
                fontSize: 12,
              ),
              cursorColor: AppColor.primaryTextColor,
              decoration: InputDecoration(
                hintText: hint,
                errorText: errorText,
                focusColor: AppColor.primaryTextColor,
                suffixIcon: Icon(
                  menus != null
                      ? Icons.keyboard_arrow_down_rounded
                      : suffixIcon,
                  color: AppColor.secondaryTextColor,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.secondaryTextColor,
                  ),
                ),
              ),
            ),
    );
  }

  _multiSelect() {
    List<Map<String, String>?>? dataSource = menus?.map((e) {
      return {
        "display": e.toString(),
        "value": e.toString(),
      };
    }).toList();

    print(dataSource);
    return MultiSelectFormField(
      autovalidate: AutovalidateMode.disabled,
      checkBoxActiveColor: AppColor.primaryColor,
      checkBoxCheckColor: Colors.white,
      dialogShapeBorder: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      title: const Text('Crops'),
      validator: (value) {
        if (value == null || value.length == 0) {
          return 'Please select one or more options';
        }
        return null;
      },
      dataSource: const [
        {
          "display": "Type One",
          "value": "Type One",
        },
        {
          "display": "Type Two",
          "value": "Type Two",
        },
        {
          "display": "Type Three",
          "value": "Type Three",
        },
        {
          "display": "Type Four",
          "value": "Type Four",
        },
        {
          "display": "Type Five",
          "value": "Type Five",
        }
      ],
      textField: 'display',
      valueField: 'value',
      okButtonLabel: 'OK',
      cancelButtonLabel: 'CANCEL',
      hintWidget: Text(hint ?? ""),
      onSaved: (value) {
        if (value == null) return;
      },
      addButtonTitle: "Add New Crop",
      onAddButtonClicked: onAddButtonClick,
    );
  }
}
