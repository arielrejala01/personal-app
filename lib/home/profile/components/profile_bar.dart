import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileBar extends StatefulWidget {
  const ProfileBar({super.key});

  @override
  State<ProfileBar> createState() => _ProfileBarState();
}

class _ProfileBarState extends State<ProfileBar> {
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
                  onTap: () {},
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
                physique('Weight', '73.8')
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
            style: TextStyle(
                color: Color.fromRGBO(112, 112, 112, 1),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          Text(value,
              style: TextStyle(
                  color: Color.fromRGBO(112, 112, 112, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.w500))
        ],
      ),
    );
  }
}
