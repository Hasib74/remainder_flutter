import 'package:filednote/presentation/disease/screen/add_disease.dart';
import 'package:filednote/presentation/disease/screen/all_disease_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/src/consumer.dart';
import 'package:filednote/presentation/app_widgets.dart';

import 'core/env/env.dart';

/*
void main() => runApp( const MaterialApp(
      home: AddDiseaseScreen(),
    ));
*/

void main() => Main();

class Main extends Env {
  @override
  Future<HookConsumerWidget> onCreate() async  {
    return AppWidget();
  }
}
