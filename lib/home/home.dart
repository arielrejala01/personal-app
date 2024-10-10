import 'package:flutter/material.dart';
import 'package:personal_app/home/gym/gym.dart';
import 'package:personal_app/home/liquid/liquid.dart';
import 'package:personal_app/home/profile/profile.dart';

class Home extends StatefulWidget {
  final int index;
  const Home({super.key, required this.index});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> pages = [
    Text('Home'),
    const Gym(),
    const Liquid(),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: pages[widget.index],
    );
  }
}
