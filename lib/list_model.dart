import 'package:hooks_riverpod/hooks_riverpod.dart';


class ListModel extends StateNotifier<List<String>>{
  ListModel(List<String> state): super(state??[]);
}