import 'package:flutter/material.dart';
import 'package:personal_app/home/profile/components/profile_bar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Center(
        child: Column(
          children: [ProfileBar()],
        ),
      ),
    );
  }
}
