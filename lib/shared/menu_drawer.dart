import 'package:fitness_app/screens/bmi_screen.dart';
import 'package:fitness_app/screens/intro_screen.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItem(context),
      ),
    );
  }

  List<Widget> buildMenuItem(BuildContext context) {
    final List<String> menuTitles = [
      'Home',
      'BMI Calcultor',
      'Weather',
      'Training',
    ];

    List<Widget> menuItems = [];

    menuItems.add(
      const DrawerHeader(
        decoration: BoxDecoration(color: Colors.blueGrey),
        child: Text(
          'Fitness',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    );

    for (var element in menuTitles) {
      Widget screen = Container();
      menuItems.add(
        ListTile(
          title: Text(
            element,
            style: const TextStyle(fontSize: 18),
          ),
          onTap: () {
            switch (element) {
              case 'Home':
                screen = const IntroScreen();
                break;
              case 'BMI Calcultor':
                screen = const BmiScreen();
                break;
              default:
            }
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => screen),
            );
          },
        ),
      );
    }

    return menuItems;
  }
}
