class WeatherModel {
  final String day;
  final String icon;
  final String description;
  final String degree;
  final String min;
  final String max;
  final String night;
  final String humidity;

  WeatherModel(
    this.icon,
    this.description,
    this.degree,
    this.min,
    this.max,
    this.night,
    this.humidity,
    this.day,
  );

  WeatherModel.fromJson(Map<String, dynamic> json)
      : icon = json['icon'] ?? '',
        description = json['description'] ?? '',
        degree = json['degree'] ?? '',
        min = json['min'] ?? '',
        max = json['max'] ?? '',
        night = json['night'] ?? '',
        humidity = json['humidity'] ?? '',
        day = _turkishToEnglish(json['day'] ?? '');

  static String _turkishToEnglish(String trDay) {
    switch (trDay.toLowerCase()) {
      case 'pazartesi':
        return 'Monday';
      case 'salı':
        return 'Tuesday';
      case 'çarşamba':
        return 'Wednesday';
      case 'perşembe':
        return 'Thursday';
      case 'cuma':
        return 'Friday';
      case 'cumartesi':
        return 'Saturday';
      case 'pazar':
        return 'Sunday';
      default:
        return trDay;
    }
  }
}