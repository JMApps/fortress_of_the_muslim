import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentIndexCubit extends Cubit<int> {
  CurrentIndexCubit() : super(0);

  increment() => emit(state + 1);
  decrement() => emit(state - 1);
}
