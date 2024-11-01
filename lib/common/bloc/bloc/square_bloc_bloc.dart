import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'square_bloc_event.dart';
part 'square_bloc_state.dart';

class SquareBlocBloc extends Bloc<SquareBlocEvent, SquareBlocState> {
  SquareBlocBloc() : super(SquareState(history: const [])) {
    on<IncrementCountEvent>((event, emit) {
      final currentState = state as SquareState;
      final newHistory = [...currentState.history, event.count];

      emit(SquareState(history: newHistory));
    });
  }
}
