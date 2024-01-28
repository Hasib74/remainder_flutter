import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

import '../../generated/assets.dart';

class AppUtils {
  AppUtils._();

  static Gap largeGap = const Gap(32);
  static Gap mediumGap = const Gap(16);
  static Gap smallGap = const Gap(8);

  static Image logo = const Image(
    image: AssetImage(Assets.imagesLogo),
    height: 100,
    width: 100,
  );
}
