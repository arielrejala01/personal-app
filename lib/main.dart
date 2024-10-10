import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:personal_app/home/home.dart';
import 'package:personal_app/services/local_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.configurePrefs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Personal App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(132, 182, 244, 1),
          title: Text(
            widget.title,
            style: const TextStyle(
                color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
        body: Home(
          index: selectedIndex,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          selectedItemColor: const Color.fromRGBO(132, 182, 244, 1),
          unselectedItemColor: const Color.fromRGBO(160, 160, 160, 1),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.house), label: ''),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.weightHanging), label: ''),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.glassWater), label: ''),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.solidUser), label: '')
          ],
        ));
  }
}
