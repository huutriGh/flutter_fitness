import 'package:fitness_app/models/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHelper {
  //https://api.openweathermap.org/data/2.5/weather?q=london&appid=07093432968b212cb0524a7de06adbde

  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = '07093432968b212cb0524a7de06adbde';
  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameter = {'q': location, 'appid': apiKey};

    Uri uri = Uri.https(authority, path, parameter);
    http.Response result = await http.get(uri);
    Map<String, dynamic> data = jsonDecode(result.body);
    Weather weather = Weather.fromJson(data);
    return weather;
  }
}
