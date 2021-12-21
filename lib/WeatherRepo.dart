import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_app_bloc/WeatherModel.dart';


class WeatherRepo {

  Future<Object> getWeather(String city) async {
    //final result = await http.Client().get("https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=64a9a079e7a2770ebb2a83eff61a0600");
    //final result = await http.Client().get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=10c1f69f7c45e3d1a8de463c1262f871"));
    final result = await http.Client().get("https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=10c1f69f7c45e3d1a8de463c1262f871");

    if (result.statusCode != 200) {
      throw Exception();

    }

    return parsedJson(result.body);
  }

  WeatherModel parsedJson(final response) {
    final jsonDecoded = json.decode(response);

    final jsonWeather = jsonDecoded["main"];

    return WeatherModel.fromJson(jsonWeather);
  }
}

//api.openweathermap.org/data/2.5/weather?q=London,uk&callback=test&appid=10c1f69f7c45e3d1a8de463c1262f871