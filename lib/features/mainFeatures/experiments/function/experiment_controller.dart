import 'package:flutter/cupertino.dart';

class ExperimentController {
 Map<String, TextEditingController>
      treatmentAndReplicationTextFiledController = {};
  List<String> cropsMenus = [];

  List<String> diseaseMenus = [];

  TextEditingController codeTextEditingController = TextEditingController();

  TextEditingController nameTextEditingController = TextEditingController();

  TextEditingController locationTextEditingController = TextEditingController();

  TextEditingController cropsTextEditingController = TextEditingController();

  TextEditingController diseaseTextEditingController = TextEditingController();

  TextEditingController treatmentTextEditingController =
      TextEditingController();

  TextEditingController replicationTextEditingController =
      TextEditingController();

 String trKey(int t_index, int r_index) => "t-${t_index},r-${r_index}";
}
