import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controllers/selected_date_provider.dart';

class HomeBody extends HookConsumerWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(selectedDateProvider, (previous, next) {
      print("previous $previous");
      print("next $next");
    });

    var selectedDate = ref.watch(selectedDateProvider);

    // TODO: implement buildF
    return Center(
      child: Text(selectedDate.toString()),
    );
  }
}
