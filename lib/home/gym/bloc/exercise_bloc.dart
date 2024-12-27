import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:personal_app/models/exercise.dart';
import 'package:personal_app/services/api_provider.dart';

part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  ApiProvider provider = ApiProvider();
  ExerciseBloc() : super(ExerciseInitial()) {
    on<SearchExercises>(_mapSearchExercisesToState);
  }

  _mapSearchExercisesToState(SearchExercises event, emit) async {
    emit(ExerciseLoading());
    try {
      var exercises = await provider.getExercises(
          type: event.type, difficulty: event.difficulty, muscle: event.muscle);
      emit(ExerciseLoaded(exercises: exercises));
    } catch (e) {
      emit(ExerciseNotLoaded(error: e.toString()));
    }
  }
}
