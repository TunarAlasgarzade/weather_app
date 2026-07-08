import 'package:weather_app/models/weather_model.dart';
import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class WeatherService {
  Future<String> _getLocation() async {
    final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Location services are disabled.");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permission is required.");
      }
    }

    final Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(accuracy: LocationAccuracy.high));

    final List<Placemark> placemark = 
        await placemarkFromCoordinates(position.latitude, position.longitude);

    final String? city = placemark[0].locality;

    if (city == null) return Future.error("Unable to determine your city.");

    return city; 
  }

  Future<List<WeatherModel>> getWeatherData() async {
    final String city = await _getLocation();

    final String url =
        "https://api.collectapi.com/weather/getWeather?lang=en&city=$city";

    const String apiKey = String.fromEnvironment('COLLECT_API_KEY');

    final headers = {
      "authorization": "apikey $apiKey",
      "content-type": "application/json",
    };

    final dio = Dio();

    final response = await dio.get(url, options: Options(headers: headers));

    if (response.statusCode != 200) {
      return Future.error("Failed to fetch weather data.");
    }

    final List list = response.data;

    final List<WeatherModel> weatherList = 
        list.map((e) => WeatherModel.fromJson(e)).toList();

    return weatherList;
  }
}