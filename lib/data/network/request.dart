import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quran/data/models/prayer_time_model.dart';
import 'package:quran/data/models/sura.dart' as surah;
import 'package:quran/data/network/endpoints.dart';

Future<PrayerTime> getPrayerTime(
    {required String date, required double lat, required double long}) async {
  var response = await http.get(
      Uri.parse('$baseTimingsURL$date?latitude=$lat&longitude=$long&method=1'));
  if (response.statusCode == 200) {
    return PrayerTime.fromMap(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load prayer time');
  }
}

Future<List<surah.Data>> getSurah() async {
  var response = await http.get(Uri.parse(baseSuratURL));
  List<surah.Data> result = [];
  if (response.statusCode == 200) {
    surah.Surat surat = surah.Surat.fromMap(jsonDecode(response.body));
    for (var element in surat.data) {
        result.add(element);
      }
    return result ;
  } else {
    throw Exception('Failed to load prayer time');
  }
}
