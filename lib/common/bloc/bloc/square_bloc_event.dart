part of 'square_bloc_bloc.dart';

@immutable
sealed class SquareBlocEvent {}

class IncrementCountEvent extends SquareBlocEvent {
  final int count;

  IncrementCountEvent({required this.count});
}
