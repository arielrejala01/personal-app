part of 'exercise_bloc.dart';

@immutable
sealed class ExerciseState {}

final class ExerciseInitial extends ExerciseState {}

final class ExerciseLoaded extends ExerciseState {
  final List<Exercise>? exercises;

  ExerciseLoaded({this.exercises});
}

final class ExerciseLoading extends ExerciseState {}

final class ExerciseNotLoaded extends ExerciseState {
  final String? error;

  ExerciseNotLoaded({this.error});
}
