import 'package:flutter/material.dart';
import 'package:hooks_riverpod/src/consumer.dart';
import 'package:filednote/presentation/app_widgets.dart';

import 'core/env/env.dart';

void main() => Main();

class Main extends Env {
  @override
  Future<HookConsumerWidget> onCreate() async  {
    return AppWidget();
  }
}
