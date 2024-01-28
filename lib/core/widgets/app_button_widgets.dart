import 'package:flutter/material.dart';
import 'package:filednote/core/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppButton extends StatelessWidget {
  String? title;

  Function()? onPressed;
  Color? color, textColor, borderColor;
  double? height;
  double? width;
  double? radius;
  double? fontSize;
  double? borderWidth;
  FontWeight? fontWeight;
  TextStyle? style;
  String? trailingIcon;

  double? padding;

  bool? isAbsorb;

  AppButton({
    Key? key,
    this.title,
    this.onPressed,
    this.color,
    this.textColor,
    this.borderColor,
    this.height,
    this.width,
    this.radius,
    this.fontSize,
    this.borderWidth,
    this.fontWeight,
    this.style,
    this.trailingIcon,
    this.padding,
    this.isAbsorb = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("isAbsorb: $isAbsorb");
    return AbsorbPointer(
      absorbing: isAbsorb!,
      child: Container(
        width: width ?? MediaQuery.sizeOf(context).width * 0.8,
        height: height ?? 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 10),
          border: Border.all(
            color: borderColor ?? AppColor.primaryColor,
            width: borderWidth ?? 0,
          ),
          gradient: LinearGradient(
            colors: [
              AppColor.primaryColor,
              AppColor.secondaryColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Colors.transparent,
              ),
              // elevation: MaterialStateProperty.all<double>(5),

              shadowColor: MaterialStateProperty.all<Color>(
                Colors.transparent,
              ),
              overlayColor:
                  MaterialStateProperty.all<Color>(AppColor.buttonOverlayColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius ?? 10),
                ),
              ),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.zero,
              ),

              /* fixedSize: MaterialStateProperty.all<Size>(
              Size(
                width ?? 0,
                height ?? 0,
              ),
            ),*/
            ),
            child: trailingIcon != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(title ?? '',
                          style: style ??
                              TextStyle(
                                color: textColor ?? AppColor.primaryTextColor,
                                fontSize: fontSize ?? 16,
                                fontWeight: fontWeight ?? FontWeight.w500,
                              )),
                      //Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          trailingIcon!.toString(),
                          color: textColor ?? AppColor.whiteColor,
                        ),
                      )
                    ],
                  )
                : Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(title ?? '',
                          style: style ??
                              TextStyle(
                                color: textColor ?? AppColor.whiteColor,
                                fontSize: fontSize ?? 16,
                                fontWeight: fontWeight ?? FontWeight.w500,
                              )),
                    ),
                  )),
      ),
    );
  }
}
