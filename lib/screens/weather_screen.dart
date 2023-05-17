import 'package:fitness_app/data/http_helper.dart';
import 'package:fitness_app/models/weather.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController txtPlace = TextEditingController();
  Weather result = Weather('', '', 0, 0, 0, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: txtPlace,
                decoration: InputDecoration(
                  hintText: 'Enter a city',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: getData,
                  ),
                ),
              ),
            ),
            weatherRow('Place:', result.name),
            weatherRow('Description:', result.description),
            weatherRow('Temperature:', result.temperature.toStringAsFixed(2)),
            weatherRow('Perceived:', result.perceived.toStringAsFixed(2)),
            weatherRow('Pressure:', result.pressure.toStringAsFixed(2)),
            weatherRow('Humidity:', result.humidity.toStringAsFixed(2)),
          ],
        ),
      ),
    );
  }

  Future getData() async {
    HttpHelper helper = HttpHelper();
    result = await helper.getWeather(txtPlace.text);
    setState(() {});
  }

  Widget weatherRow(String lable, String value) {
    Widget row = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
              child: Text(
            lable,
            style: TextStyle(fontSize: 20, color: Theme.of(context).hintColor),
          )),
          Expanded(
              child: Text(
            value,
            style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).primaryColor,
            ),
          ))
        ],
      ),
    );
    return row;
  }
}
