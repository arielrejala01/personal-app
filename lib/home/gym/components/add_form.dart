import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_app/components/app_bar.dart';
import 'package:personal_app/home/gym/bloc/exercise_bloc.dart';
import 'package:personal_app/models/exercise.dart';

class AddExerciseForm extends StatefulWidget {
  const AddExerciseForm({super.key});

  @override
  State<AddExerciseForm> createState() => _AddExerciseFormState();
}

class _AddExerciseFormState extends State<AddExerciseForm> {
  Exercise? selectedExercise;
  String? selectedType;
  String? selectedMuscle;
  String? selectedDifficulty;

  final List<String> exerciseTypes = [
    'cardio',
    'olympic_weightlifting',
    'plyometrics',
    'powerlifting',
    'strength',
    'stretching',
    'strongman'
  ];

  final List<String> muscleGroups = [
    'abdominals',
    'abductors',
    'adductors',
    'biceps',
    'calves',
    'chest',
    'forearms',
    'glutes',
    'hamstrings',
    'lats',
    'lower_back',
    'middle_back',
    'neck',
    'quadriceps',
    'traps',
    'triceps'
  ];

  final List<String> difficulties = ['beginner', 'intermediate', 'expert'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                hint: Text('Selecciona el tipo de ejercicio'),
                value: selectedType,
                isExpanded: true,
                items: exerciseTypes.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedType = newValue;
                  });
                },
              ),
            ),

            // Dropdown para seleccionar el grupo muscular
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                hint: Text('Selecciona el grupo muscular'),
                value: selectedMuscle,
                isExpanded: true,
                items: muscleGroups.map((String muscle) {
                  return DropdownMenuItem<String>(
                    value: muscle,
                    child: Text(muscle),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedMuscle = newValue;
                  });
                },
              ),
            ),

            // Dropdown para seleccionar la dificultad
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                hint: Text('Selecciona la dificultad'),
                value: selectedDifficulty,
                isExpanded: true,
                items: difficulties.map((String difficulty) {
                  return DropdownMenuItem<String>(
                    value: difficulty,
                    child: Text(difficulty),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedDifficulty = newValue;
                  });
                },
              ),
            ),
            InkWell(
              onTap: () {
                BlocProvider.of<ExerciseBloc>(context).add(SearchExercises(
                    type: selectedType,
                    difficulty: selectedDifficulty,
                    muscle: selectedMuscle));
              },
              child: Text(
                'Buscar',
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            )
          ],
        ));
  }
}
