import 'dart:convert';

WeatherModal weatherModalFromJson(String str) =>
    WeatherModal.fromJson(json.decode(str));

String weatherModalToJson(WeatherModal data) => json.encode(data.toJson());

class WeatherModal {
  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

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

  WeatherModal copyWith({
    Coord? coord,
    List<Weather>? weather,
    String? base,
    Main? main,
    int? visibility,
    Wind? wind,
    Clouds? clouds,
    int? dt,
    Sys? sys,
    int? timezone,
    int? id,
    String? name,
    int? cod,
  }) =>
      WeatherModal(
        coord: coord ?? this.coord,
        weather: weather ?? this.weather,
        base: base ?? this.base,
        main: main ?? this.main,
        visibility: visibility ?? this.visibility,
        wind: wind ?? this.wind,
        clouds: clouds ?? this.clouds,
        dt: dt ?? this.dt,
        sys: sys ?? this.sys,
        timezone: timezone ?? this.timezone,
        id: id ?? this.id,
        name: name ?? this.name,
        cod: cod ?? this.cod,
      );

  factory WeatherModal.fromJson(Map<String, dynamic> json) => WeatherModal(
        coord: json["coord"] == null ? null : Coord.fromJson(json["coord"]),
        weather: json["weather"] == null
            ? []
            : List<Weather>.from(
                json["weather"]!.map((x) => Weather.fromJson(x))),
        base: json["base"],
        main: json["main"] == null ? null : Main.fromJson(json["main"]),
        visibility: json["visibility"],
        wind: json["wind"] == null ? null : Wind.fromJson(json["wind"]),
        clouds: json["clouds"] == null ? null : Clouds.fromJson(json["clouds"]),
        dt: json["dt"],
        sys: json["sys"] == null ? null : Sys.fromJson(json["sys"]),
        timezone: json["timezone"],
        id: json["id"],
        name: json["name"],
        cod: json["cod"],
      );

  Map<String, dynamic> toJson() => {
        "coord": coord?.toJson(),
        "weather": weather == null
            ? []
            : List<dynamic>.from(weather!.map((x) => x.toJson())),
        "base": base,
        "main": main?.toJson(),
        "visibility": visibility,
        "wind": wind?.toJson(),
        "clouds": clouds?.toJson(),
        "dt": dt,
        "sys": sys?.toJson(),
        "timezone": timezone,
        "id": id,
        "name": name,
        "cod": cod,
      };
}

class Clouds {
  int? all;

  Clouds({
    this.all,
  });

  Clouds copyWith({
    int? all,
  }) =>
      Clouds(
        all: all ?? this.all,
      );

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
      );

  Map<String, dynamic> toJson() => {
        "all": all,
      };
}

class Coord {
  double? lon;
  double? lat;

  Coord({
    this.lon,
    this.lat,
  });

  Coord copyWith({
    double? lon,
    double? lat,
  }) =>
      Coord(
        lon: lon ?? this.lon,
        lat: lat ?? this.lat,
      );

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"]?.toDouble(),
        lat: json["lat"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
      };
}

class Main {
  double? temp;
  int? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;

  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  Main copyWith({
    double? temp,
    int? feelsLike,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? humidity,
  }) =>
      Main(
        temp: temp ?? this.temp,
        feelsLike: feelsLike ?? this.feelsLike,
        tempMin: tempMin ?? this.tempMin,
        tempMax: tempMax ?? this.tempMax,
        pressure: pressure ?? this.pressure,
        humidity: humidity ?? this.humidity,
      );

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"]?.toDouble(),
        feelsLike: json["feels_like"],
        tempMin: json["temp_min"]?.toDouble(),
        tempMax: json["temp_max"]?.toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
      };
}

class Sys {
  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;

  Sys({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  });

  Sys copyWith({
    int? type,
    int? id,
    String? country,
    int? sunrise,
    int? sunset,
  }) =>
      Sys(
        type: type ?? this.type,
        id: id ?? this.id,
        country: country ?? this.country,
        sunrise: sunrise ?? this.sunrise,
        sunset: sunset ?? this.sunset,
      );

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        type: json["type"],
        id: json["id"],
        country: json["country"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "country": country,
        "sunrise": sunrise,
        "sunset": sunset,
      };
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  Weather copyWith({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) =>
      Weather(
        id: id ?? this.id,
        main: main ?? this.main,
        description: description ?? this.description,
        icon: icon ?? this.icon,
      );

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}

class Wind {
  double? speed;
  int? deg;

  Wind({
    this.speed,
    this.deg,
  });

  Wind copyWith({
    double? speed,
    int? deg,
  }) =>
      Wind(
        speed: speed ?? this.speed,
        deg: deg ?? this.deg,
      );

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"]?.toDouble(),
        deg: json["deg"],
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
      };
}
