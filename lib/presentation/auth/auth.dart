import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:filednote/core/theme/app_colors.dart';
import 'package:filednote/core/theme/app_theme.dart';
import 'package:filednote/core/utls/app_utls.dart';
import 'package:filednote/l10n/language.dart';
import 'package:filednote/l10n/selead/language.dart';
import 'package:filednote/presentation/auth/section/signIn/sign_in_screen.dart';
import 'package:filednote/presentation/auth/section/signUp/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

/*SegmentedTabControl(
                height: 32,
                tabPadding: const EdgeInsets.symmetric(horizontal: 32),
                backgroundGradient: const LinearGradient(
                  colors: [Colors.white, Colors.white],
                ),
                tabs: [
                  SegmentTab(
                    textColor: Colors.black,
                    color: Colors.blue,
                    backgroundColor: Colors.white,
                    label: language(context)!.signIn,
                    gradient: LinearGradient(
                      colors: [AppColor.primaryColor, AppColor.secondaryColor],
                    ),
                  ),
                  SegmentTab(
                    textColor: Colors.black,
                    backgroundColor: Colors.white,
                    color: Colors.red,
                    label: language(context)!.signUp,
                    gradient: LinearGradient(
                      colors: [AppColor.primaryColor, AppColor.secondaryColor],
                    ),
                  ),
                ],
              )*/

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  Widget _buildGradientTab(String text) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColor.primaryColor, AppColor.secondaryColor],
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: DefaultTabController(
          length: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                AppUtils.mediumGap,
                Container(
                  height: 42,
                  decoration: BoxDecoration(
                    borderRadius: AppTheme.borderRadius,
                    color: Colors.white,
                    boxShadow: AppTheme.shadow,
                  ),
                  child: TabBar(
                    tabs: [
                      Tab(
                        text: language(context)!.signIn,
                      ),
                      Tab(
                        text: language(context)!.signUp,
                      ),
                    ],
                    dividerColor: Colors.transparent,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      gradient: LinearGradient(
                        colors: [
                          AppColor.primaryColor,
                          AppColor.secondaryColor
                        ],
                      ),
                    ),
                  ),
                ),
                AppUtils.mediumGap,
                Expanded(
                  child: TabBarView(
                    children: [
                      SignInScreen(),
                      SignUpScreen(),
                    ],
                  ),
                ),
              ],
            ),
          )),
    ));
  }
}
