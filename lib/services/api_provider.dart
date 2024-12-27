import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:personal_app/models/exercise.dart';

class ApiProvider {
  Future<List<Exercise>> getExercises({
    String? type,
    String? muscle,
    String? difficulty,
  }) async {
    String apiUrl = 'https://api.api-ninjas.com/v1/exercises?';

    if (type != null) {
      apiUrl += 'type=$type&';
    }
    if (muscle != null) {
      apiUrl += 'muscle=$muscle&';
    }
    if (difficulty != null) {
      apiUrl += 'difficulty=$difficulty&';
    }

    String apiKey = '6/nGzFJdufnzhPQsEGocIw==vzghI4fnvzKnoqrT';

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {'X-Api-Key': apiKey},
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Exercise.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar los datos');
    }
  }
}
