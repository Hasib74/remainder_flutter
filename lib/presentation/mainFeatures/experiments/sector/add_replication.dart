import 'package:filednote/core/utls/app_utls.dart';
import 'package:filednote/core/widgets/app_text_filed.dart';
import 'package:filednote/presentation/mainFeatures/experiments/function/experiment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../provider/add_replication_provider.dart';

class AddReplication extends ConsumerWidget {
  const AddReplication({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var _addReplicationProvider = ref.watch(addReplicationProvider);

    print("addReplicationProvider: rep ${_addReplicationProvider.replication}");
    print("addReplicationProvider: treat ${_addReplicationProvider.treatment}");

    ExperimentController controller = ExperimentController();

    if (_addReplicationProvider.replication == 0 ||
        _addReplicationProvider.treatment == 0) {
      return Container();
    }

    return Column(
      children: [
        Text("Treatment & Replication",
            style: Theme.of(context).textTheme.titleLarge),
        Gap(16),
        Text("Treatment ${1}", style: Theme.of(context).textTheme.titleMedium),
        ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, int t_index) {
              return ListView.separated(
                  padding: const EdgeInsets.only(bottom: 16),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, int r_index) {
                    Map<String, TextEditingController> map = {
                      controller.trKey(t_index, r_index):
                          TextEditingController(),
                    };

                    controller.treatmentAndReplicationTextFiledController
                        .addAll(map);

                    return AppTextFiled(
                      hint: "R ${r_index + 1}",
                      controller:
                          controller.treatmentAndReplicationTextFiledController[
                              controller.trKey(t_index, r_index)],
                      onChanged: (value) {},
                    );
                  },
                  separatorBuilder: (context, int index) {
                    return Container();
                  },
                  itemCount: _addReplicationProvider.replication ?? 0);
            },
            separatorBuilder: (context, int index) {
              return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(
                    child: Text("Treatment ${index + 2}",
                        style: Theme.of(context).textTheme.titleMedium),
                  ));
            },
            itemCount: _addReplicationProvider.treatment ?? 0),
      ],
    );
  }
}
