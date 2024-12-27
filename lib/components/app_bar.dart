import 'package:flutter/material.dart';

appBar(BuildContext context) {
  return AppBar(
    backgroundColor: const Color.fromRGBO(132, 182, 244, 1),
    title: const Text(
      'Personal App',
      style: TextStyle(
          color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
    ),
  );
}
