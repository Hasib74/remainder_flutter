import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:filednote/presentation/addRemainder/enum/frequency_enum.dart';

var frequencyProvider = StateProvider((ref) => FrequencyEnum.everyDay);
