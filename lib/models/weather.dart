class Weather {
  String name = '';
  String description = '';
  double temperature = 0;
  double perceived = 0;
  int pressure = 0;
  int humidity = 0;
  Weather(this.name, this.description, this.temperature, this.perceived,
      this.pressure, this.humidity);
  Weather.fromJson(Map<String, dynamic> weather) {
    name = weather['name'];
    temperature = (weather['main']['temp'] - 273.15) ?? 0;
    perceived = (weather['main']['feels_like'] - 273.15) ?? 0;
    pressure = (weather['main']['pressure']) ?? 0;
    humidity = (weather['main']['humidity']) ?? 0;
    description = (weather['weather'][0]['description']) ?? '';
  }
}
