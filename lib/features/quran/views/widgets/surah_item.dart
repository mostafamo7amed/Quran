import 'package:flutter/material.dart';
import 'package:quran/core/utils/constants/assets.dart';
import 'package:quran/core/utils/models/surah_details.dart';

class SurahItem extends StatelessWidget {
  const SurahItem({super.key,required this.ayat});
  final Ayat ayat;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      semanticContainer: true,
      borderOnForeground: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(child: Text(ayat.teksArab, textAlign: TextAlign.center,)),
          ],
        ),
      ),
    );
  }
}
