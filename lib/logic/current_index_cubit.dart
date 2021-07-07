import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentIndexCubit extends Cubit<int> {
  CurrentIndexCubit() : super(1);

  increment() => emit(state + 1);
  decrement() => emit(state - 1);
}
