import 'package:filednote/presentation/crops/screen/crops_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/src/consumer.dart';
import 'package:filednote/presentation/app_widgets.dart';

import 'core/env/env.dart';

void main() => runApp(MaterialApp(
      home: CropListScreen(),
    ));

/*
void main() => Main();

class Main extends Env {
  @override
  Future<HookConsumerWidget> onCreate() async  {
    return AppWidget();
  }
}
*/
