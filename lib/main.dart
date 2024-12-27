import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:personal_app/components/app_bar.dart';
import 'package:personal_app/home/gym/bloc/exercise_bloc.dart';
import 'package:personal_app/home/home.dart';
import 'package:personal_app/routes.dart';
import 'package:personal_app/services/local_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.configurePrefs();
  runApp(const MyAppProviders());
}

class MyAppProviders extends StatelessWidget {
  const MyAppProviders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ExerciseBloc>(create: (context) => ExerciseBloc()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(132, 182, 244, 1)),
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(foregroundColor: Colors.white),
        appBarTheme: const AppBarTheme(foregroundColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      routes: routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context),
        body: Home(
          index: selectedIndex,
        ),
        floatingActionButton: selectedIndex == 1
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/add_exercise');
                },
                backgroundColor: const Color.fromRGBO(132, 182, 244, 1),
                child: const Icon(
                  Icons.add,
                  size: 35,
                ),
              )
            : null,
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
