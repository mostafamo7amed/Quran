import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quran/core/utils/models/prayer_time_model.dart';
import 'package:quran/core/utils/models/sura.dart' as surah;
import 'package:quran/core/utils/models/surah_details.dart';
import 'package:quran/core/utils/network/endpoints.dart';

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
    return result;
  } else {
    throw Exception('Failed to load prayer time');
  }
}

Future<List<Ayat>> getSurahDetails(int surahNumber) async {
  var response = await http.get(Uri.parse('$baseSuratURL/$surahNumber'));
  List<Ayat> result = [];
  if (response.statusCode == 200) {
    SurahDetails surat = SurahDetails.fromMap(jsonDecode(response.body));
    for (var element in surat.data.ayat) {
      result.add(element);
    }
    return result;
  } else {
    throw Exception('Failed to load surah details');
  }
}
