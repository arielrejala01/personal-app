import 'package:flutter/material.dart';
import 'package:personal_app/home/gym/components/add_form.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/add_exercise': (BuildContext context) => const AddExerciseForm(),
};
