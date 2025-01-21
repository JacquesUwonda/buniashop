import 'package:flutter_bloc/flutter_bloc.dart';

class DotIndicatorCubit extends Cubit<int> {
  DotIndicatorCubit() : super(0);
  void updateIndex(int index) => emit(index);
}
