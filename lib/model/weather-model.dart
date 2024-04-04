import 'dart:convert';

class WeatherModal {
  WeatherModal({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  factory WeatherModal.fromRawJson(String str) =>
      WeatherModal.fromJson(json.decode(str) as Map<String, dynamic>);

  factory WeatherModal.fromJson(Map<String, dynamic> json) => WeatherModal(
        coord: json['coord'] == null
            ? null
            : Coord.fromJson(json['coord'] as Map<String, dynamic>),
        weather: json['weather'] == null
            ? []
            : (json['weather'] as List<dynamic>)
                .map(
                  (weatherJson) =>
                      Weather.fromJson(weatherJson as Map<String, dynamic>),
                )
                .toList(),
        base: json['base'] as String?,
        main: json['main'] == null
            ? null
            : Main.fromJson(json['main'] as Map<String, dynamic>),
        visibility: json['visibility'] as int?,
        wind: json['wind'] == null
            ? null
            : Wind.fromJson(json['wind'] as Map<String, dynamic>),
        clouds: json['clouds'] == null
            ? null
            : Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
        dt: json['dt'] as int?,
        sys: json['sys'] == null
            ? null
            : Sys.fromJson(json['sys'] as Map<String, dynamic>),
        timezone: json['timezone'] as int?,
        id: json['id'] as int?,
        name: json['name'] as String?,
        cod: json['cod'] as int?,
      );

  final Coord? coord;
  final List<Weather>? weather;
  final String? base;
  final Main? main;
  final int? visibility;
  final Wind? wind;
  final Clouds? clouds;
  final int? dt;
  final Sys? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;

  String toRawJson(String string) => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'coord': coord?.toJson(),
        'weather': weather == null
            ? []
            : List<dynamic>.from(weather!.map((x) => x.toJson())),
        'base': base,
        'main': main?.toJson(),
        'visibility': visibility,
        'wind': wind?.toJson(),
        'clouds': clouds?.toJson(),
        'dt': dt,
        'sys': sys?.toJson(),
        'timezone': timezone,
        'id': id,
        'name': name,
        'cod': cod,
      };
}

class Clouds {
  Clouds({
    this.all,
  });

  factory Clouds.fromRawJson(String str) =>
      Clouds.fromJson(json.decode(str) as Map<String, dynamic>);

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json['all'] as int?,
      );

  final int? all;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'all': all,
      };
}

class Coord {
  Coord({
    this.lon,
    this.lat,
  });

  factory Coord.fromRawJson(String str) =>
      Coord.fromJson(json.decode(str) as Map<String, dynamic>);

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json['lon']?.toDouble() as double?,
        lat: json['lat']?.toDouble() as double?,
      );

  final double? lon;
  final double? lat;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'lon': lon,
        'lat': lat,
      };
}

class Main {
  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  factory Main.fromRawJson(String str) =>
      Main.fromJson(json.decode(str) as Map<String, dynamic>);

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json['temp']?.toDouble() as double?,
        feelsLike: json['feels_like'] as int?,
        tempMin: json['temp_min']?.toDouble() as double?,
        tempMax: json['temp_max']?.toDouble() as double?,
        pressure: json['pressure'] as int?,
        humidity: json['humidity'] as int?,
      );

  final double? temp;
  final int? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? humidity;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'temp': temp,
        'feels_like': feelsLike,
        'temp_min': tempMin,
        'temp_max': tempMax,
        'pressure': pressure,
        'humidity': humidity,
      };
}

class Sys {
  Sys({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  });

  factory Sys.fromRawJson(String str) =>
      Sys.fromJson(json.decode(str) as Map<String, dynamic>);

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        type: json['type'] as int?,
        id: json['id'] as int?,
        country: json['country'] as String?,
        sunrise: json['sunrise'] as int?,
        sunset: json['sunset'] as int?,
      );

  final int? type;
  final int? id;
  final String? country;
  final int? sunrise;
  final int? sunset;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'type': type,
        'id': id,
        'country': country,
        'sunrise': sunrise,
        'sunset': sunset,
      };
}

class Weather {
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory Weather.fromRawJson(String str) =>
      Weather.fromJson(json.decode(str) as Map<String, dynamic>);

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json['id'] as int?,
        main: json['main'] as String?,
        description: json['description'] as String?,
        icon: json['icon'] as String?,
      );

  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
      };
}

class Wind {
  Wind({
    this.speed,
    this.deg,
  });

  factory Wind.fromRawJson(String str) =>
      Wind.fromJson(json.decode(str) as Map<String, dynamic>);

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json['speed']?.toDouble() as double?,
        deg: json['deg'] as int?,
      );

  final double? speed;
  final int? deg;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'speed': speed,
        'deg': deg,
      };
}
