import 'dart:convert';

class PrayerTime {
  int? code;
  String? status;
  Data? data;

  PrayerTime({
    this.code,
    this.status,
    this.data,
  });

  factory PrayerTime.fromJson(String str) =>
      PrayerTime.fromMap(json.decode(str));

  factory PrayerTime.fromMap(Map<String, dynamic> json) => PrayerTime(
        code: json["code"],
        status: json["status"],
        data: Data.fromMap(json["data"]),
      );
}

class Data {
  Timings? timings;
  Date? date;
  Meta? meta;

  Data({
    this.timings,
    this.date,
    this.meta,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        timings: Timings.fromMap(json["timings"]),
        date: Date.fromMap(json["date"]),
        meta: Meta.fromMap(json["meta"]),
      );
}

class Date {
  String? readable;
  String? timestamp;
  Hijri? hijri;
  Gregorian? gregorian;

  Date({
    this.readable,
    this.timestamp,
    this.hijri,
    this.gregorian,
  });

  factory Date.fromJson(String str) => Date.fromMap(json.decode(str));

  factory Date.fromMap(Map<String, dynamic> json) => Date(
        readable: json["readable"],
        timestamp: json["timestamp"],
        hijri: Hijri.fromMap(json["hijri"]),
        gregorian: Gregorian.fromMap(json["gregorian"]),
      );
}

class Gregorian {
  String? date;
  String? format;
  String? day;
  GregorianWeekday? weekday;
  GregorianMonth? month;
  String? year;
  Designation? designation;

  Gregorian({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
    this.designation,
  });

  factory Gregorian.fromJson(String str) => Gregorian.fromMap(json.decode(str));

  factory Gregorian.fromMap(Map<String, dynamic> json) => Gregorian(
        date: json["date"],
        format: json["format"],
        day: json["day"],
        weekday: GregorianWeekday.fromMap(json["weekday"]),
        month: GregorianMonth.fromMap(json["month"]),
        year: json["year"],
        designation: Designation.fromMap(json["designation"]),
      );
}

class Designation {
  String? abbreviated;
  String? expanded;

  Designation({
    this.abbreviated,
    this.expanded,
  });

  factory Designation.fromJson(String str) =>
      Designation.fromMap(json.decode(str));

  factory Designation.fromMap(Map<String, dynamic> json) => Designation(
        abbreviated: json["abbreviated"],
        expanded: json["expanded"],
      );
}

class GregorianMonth {
  int? number;
  String? en;

  GregorianMonth({
    this.number,
    this.en,
  });

  factory GregorianMonth.fromJson(String str) =>
      GregorianMonth.fromMap(json.decode(str));

  factory GregorianMonth.fromMap(Map<String, dynamic> json) => GregorianMonth(
        number: json["number"],
        en: json["en"],
      );
}

class GregorianWeekday {
  String? en;

  GregorianWeekday({
    this.en,
  });

  factory GregorianWeekday.fromJson(String str) =>
      GregorianWeekday.fromMap(json.decode(str));

  factory GregorianWeekday.fromMap(Map<String, dynamic> json) =>
      GregorianWeekday(
        en: json["en"],
      );
}

class Hijri {
  String? date;
  String? format;
  String? day;
  HijriWeekday? weekday;
  HijriMonth? month;
  String? year;
  Designation? designation;
  List<dynamic>? holidays;

  Hijri({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
    this.designation,
    this.holidays,
  });

  factory Hijri.fromJson(String str) => Hijri.fromMap(json.decode(str));

  factory Hijri.fromMap(Map<String, dynamic> json) => Hijri(
        date: json["date"],
        format: json["format"],
        day: json["day"],
        weekday: HijriWeekday.fromMap(json["weekday"]),
        month: HijriMonth.fromMap(json["month"]),
        year: json["year"],
        designation: Designation.fromMap(json["designation"]),
        holidays: List<dynamic>.from(json["holidays"].map((x) => x)),
      );
}

class HijriMonth {
  int? number;
  String? en;
  String? ar;

  HijriMonth({
    this.number,
    this.en,
    this.ar,
  });

  factory HijriMonth.fromJson(String str) =>
      HijriMonth.fromMap(json.decode(str));

  factory HijriMonth.fromMap(Map<String, dynamic> json) => HijriMonth(
        number: json["number"],
        en: json["en"],
        ar: json["ar"],
      );
}

class HijriWeekday {
  String? en;
  String? ar;

  HijriWeekday({
    this.en,
    this.ar,
  });

  factory HijriWeekday.fromJson(String str) =>
      HijriWeekday.fromMap(json.decode(str));

  factory HijriWeekday.fromMap(Map<String, dynamic> json) => HijriWeekday(
        en: json["en"],
        ar: json["ar"],
      );
}

class Meta {
  double? latitude;
  double? longitude;
  String? timezone;
  Method? method;
  String? latitudeAdjustmentMethod;
  String? midnightMode;
  String? school;
  Map<String, int>? offset;

  Meta({
    this.latitude,
    this.longitude,
    this.timezone,
    this.method,
    this.latitudeAdjustmentMethod,
    this.midnightMode,
    this.school,
    this.offset,
  });

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        timezone: json["timezone"],
        method: Method.fromMap(json["method"]),
        latitudeAdjustmentMethod: json["latitudeAdjustmentMethod"],
        midnightMode: json["midnightMode"],
        school: json["school"],
        offset:
            Map.from(json["offset"]).map((k, v) => MapEntry<String, int>(k, v)),
      );
}

class Method {
  int? id;
  String? name;
  Params? params;
  Location? location;

  Method({
    this.id,
    this.name,
    this.params,
    this.location,
  });

  factory Method.fromJson(String str) => Method.fromMap(json.decode(str));

  factory Method.fromMap(Map<String, dynamic> json) => Method(
        id: json["id"],
        name: json["name"],
        params: Params.fromMap(json["params"]),
        location: Location.fromMap(json["location"]),
      );
}

class Location {
  double? latitude;
  double? longitude;

  Location({
    this.latitude,
    this.longitude,
  });

  factory Location.fromJson(String str) => Location.fromMap(json.decode(str));

  factory Location.fromMap(Map<String, dynamic> json) => Location(
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
      );
}

class Params {
  int? fajr;
  int? isha;

  Params({
    this.fajr,
    this.isha,
  });

  factory Params.fromJson(String str) => Params.fromMap(json.decode(str));

  factory Params.fromMap(Map<String, dynamic> json) => Params(
        fajr: json["Fajr"],
        isha: json["Isha"],
      );
}

class Timings {
  String? fajr;
  String? sunrise;
  String? dhuhr;
  String? asr;
  String? sunset;
  String? maghrib;
  String? isha;
  String? imsak;
  String? midnight;
  String? firstthird;
  String? lastthird;

  Timings({
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.sunset,
    this.maghrib,
    this.isha,
    this.imsak,
    this.midnight,
    this.firstthird,
    this.lastthird,
  });

  factory Timings.fromJson(String str) => Timings.fromMap(json.decode(str));

  factory Timings.fromMap(Map<String, dynamic> json) => Timings(
        fajr: json["Fajr"],
        sunrise: json["Sunrise"],
        dhuhr: json["Dhuhr"],
        asr: json["Asr"],
        sunset: json["Sunset"],
        maghrib: json["Maghrib"],
        isha: json["Isha"],
        imsak: json["Imsak"],
        midnight: json["Midnight"],
        firstthird: json["Firstthird"],
        lastthird: json["Lastthird"],
      );
}
