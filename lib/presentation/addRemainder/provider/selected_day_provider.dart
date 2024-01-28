import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:filednote/presentation/addRemainder/enum/days.dart';

var selectedDaysProvider = StateProvider<DaysEnum>((ref) => DaysEnum.SAT);
