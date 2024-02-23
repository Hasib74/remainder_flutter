import 'package:flutter_riverpod/flutter_riverpod.dart';

var addReplicationProvider =
    StateNotifierProvider<AddReplicationProvider, ExpModel>((ref) {
  return AddReplicationProvider();
});

class AddReplicationProvider extends StateNotifier<ExpModel> {
  AddReplicationProvider()
      : super(ExpModel(
          treatment: 0,
          replication: 0,
        ));

  setTreatment(int treatment) =>
      state = ExpModel(treatment: treatment, replication: state.replication);

  setReplication(int replication) =>
      state = ExpModel(treatment: state.treatment, replication: replication);

  get getTreatment => state.treatment;

  get getReplication => state.replication;

  get getExpModel => state;
}

class ExpModel {
  int? treatment;
  int? replication;

  ExpModel({this.treatment, this.replication});
}
