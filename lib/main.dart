
import 'package:hooks_riverpod/src/consumer.dart';

import 'core/env/env.dart';
import 'features/app_widgets.dart';

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
