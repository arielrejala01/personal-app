import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:personal_app/services/api_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileBar extends StatefulWidget {
  const ProfileBar({super.key});

  @override
  State<ProfileBar> createState() => _ProfileBarState();
}

class _ProfileBarState extends State<ProfileBar> {
  String storedWeight = '-';
  final TextEditingController _weightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadWeight();
  }

  Future<void> _loadWeight() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? weight = prefs.getString('weight');
    if (weight != null) {
      setState(() {
        storedWeight = weight;
        _weightController.text = weight;
      });
    }
  }

  Future<void> _saveWeight(String weight) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('weight', weight);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 40.0),
                  child: Column(
                    children: [
                      Icon(
                        FontAwesomeIcons.solidCircleUser,
                        color: Color.fromRGBO(160, 160, 160, 1),
                        size: 80,
                      ),
                      SizedBox(
                        width: 15,
                        height: 12,
                      ),
                      Text(
                        'Ariel Rejala',
                        style: TextStyle(
                            color: Color.fromRGBO(112, 112, 112, 1),
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () async {
                    ApiProvider apiProvider = ApiProvider();
                    var lista = await apiProvider.getExercises();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(132, 182, 244, 0.2),
                          )
                        ],
                        color: Color.fromRGBO(132, 182, 244, 0.35)),
                    child: const Icon(
                      FontAwesomeIcons.pencil,
                      size: 20,
                      color: Color.fromRGBO(0, 118, 182, 1),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.5), blurRadius: 5)
              ],
              color: Colors.white),
          width: 310,
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                physique('Age', '20'),
                const VerticalDivider(
                  indent: 10,
                  endIndent: 10,
                  color: Color.fromRGBO(189, 189, 189, 1),
                  thickness: 1,
                ),
                physique('Height', '176'),
                const VerticalDivider(
                  indent: 10,
                  endIndent: 10,
                  color: Color.fromRGBO(189, 189, 189, 1),
                  thickness: 1,
                ),
                physique('Weight', storedWeight)
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget physique(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: 90,
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Color.fromRGBO(112, 112, 112, 1),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          Text(value,
              style: const TextStyle(
                  color: Color.fromRGBO(112, 112, 112, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.w500))
        ],
      ),
    );
  }

  void openEditProfileModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 0,
          actionsAlignment: MainAxisAlignment.center,
          title: const Text('Edit your profile'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Weight',
                  hintText: 'Insert your weight',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(132, 182, 244, 1),
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                ),
                controller: _weightController,
              ),
            ],
          ),
          actions: <Widget>[
            SizedBox(
              width: 110,
              child: ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.resolveWith(
                      (states) => const EdgeInsets.all(0)),
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => const Color.fromRGBO(170, 170, 170, 1)),
                  shape: MaterialStateProperty.resolveWith(
                    (states) => const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
                child: const Text(
                  'Cancelar',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            SizedBox(
              width: 110,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => const Color.fromRGBO(132, 182, 244, 1)),
                    shape: MaterialStateProperty.resolveWith(
                      (states) => const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    )),
                child: const Text(
                  'Guardar',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () {
                  String currentWeight = _weightController.text;
                  _saveWeight(currentWeight);
                  setState(() {
                    storedWeight = currentWeight;
                  });
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
