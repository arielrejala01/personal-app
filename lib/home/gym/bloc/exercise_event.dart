part of 'exercise_bloc.dart';

@immutable
sealed class ExerciseEvent {}

final class SearchExercises extends ExerciseEvent {
  final String? type;
  final String? muscle;
  final String? difficulty;

  SearchExercises({this.type, this.muscle, this.difficulty});
}
