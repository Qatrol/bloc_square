part of 'square_bloc_bloc.dart';

@immutable
sealed class SquareBlocState {}

final class SquareBlocInitial extends SquareBlocState {}

final class SquareState extends SquareBlocState {
  final List<int> history;

  SquareState({required this.history});
}
