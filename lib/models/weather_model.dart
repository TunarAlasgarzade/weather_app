class WeatherModel {
  final String gun;
  final String logo;
  final String status;
  final String derece;
  final String min;
  final String max;
  final String gece;
  final String nem;

  WeatherModel(this.logo, this.status, this.derece, this.min, this.max,
   this.gece, this.nem, this.gun);

  WeatherModel.fromJson(Map<String, dynamic> json)
    : logo = json['icon'] ?? '', 
      status = json['description'] ?? '', 
      derece = json['degree'] ?? '', 
      min = json['min'] ?? '', 
      max = json['max'] ?? '', 
      gece = json['night'] ?? '', 
      nem = json['humidity'] ?? '',
      gun = _turkcedenAzerbaycana(json['day'] ?? ''); // Statik funksiyanı burada çağırırıq

  // Türkcə günləri Azərbaycan dilinə çevirən statik funksiya
  static String _turkcedenAzerbaycana(String trGun) {
    switch (trGun.toLowerCase()) {
      case 'pazartesi': return 'Bazar ertəsi';
      case 'salı': return 'Çərşənbə axşamı';
      case 'çarşamba': return 'Çərşənbə';
      case 'perşembe': return 'Cümə axşamı';
      case 'cuma': return 'Cümə';
      case 'cumartesi': return 'Şənbə';
      case 'pazar': return 'Bazar';
      default: return trGun;
    }
  }
}