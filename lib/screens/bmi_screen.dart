import 'package:fitness_app/shared/menu_bottom.dart';
import 'package:fitness_app/shared/menu_drawer.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController txtHeight = TextEditingController();
  final TextEditingController txtWeight = TextEditingController();
  bool isMetric = true;
  bool isImperial = false;
  late List<bool> isSelected;
  final double fontSize = 18;

  String result = '';

  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
        ),
        drawer: const MenuDrawer(),
        bottomNavigationBar: const MenuBottom(),
        body: Column(
          children: [
            ToggleButtons(
              isSelected: isSelected,
              onPressed: toggleMeasure,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Metric',
                    style: TextStyle(fontSize: fontSize),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Imperial',
                    style: TextStyle(fontSize: fontSize),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                controller: txtHeight,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(hintText: "Please insert ..."),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                controller: txtWeight,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(hintText: "Please insert ..."),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Calculate BMI',
                style: TextStyle(fontSize: fontSize),
              ),
            ),
            Text(
              result,
              style: TextStyle(fontSize: fontSize),
            ),
          ],
        ));
  }

  void toggleMeasure(value) {
    if (value == 0) {
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }
    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }

  void findBMi() {
    double bmi = 0;
    double height = double.tryParse(txtHeight.text) ?? 0;
    double weight = double.tryParse(txtWeight.text) ?? 0;
    if (isMetric) {
      bmi = weight / (height * height);
    } else {
      bmi = weight * 703 / (height * height);
    }
  }
}
