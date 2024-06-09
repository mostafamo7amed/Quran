import 'package:flutter/material.dart';
import 'package:quran/core/utils/constants/assets.dart';
import 'package:quran/core/utils/models/sura.dart' as Surah;
import 'package:quran/core/utils/network/request.dart';
import 'package:quran/features/quran/views/widgets/surah_details_view.dart';

class QuranItem extends StatelessWidget {
  const QuranItem({super.key, required this.suraList, required this.index});
  final Surah.Data suraList;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SurahDetailsView(
              surah: suraList,
              index:index,
            ),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        semanticContainer: true,
        borderOnForeground: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    AssetsData.circleImage,
                    height: 45,
                  ),
                  Text('${suraList.nomor}'),
                ],
              ),
              const SizedBox(
                width: 5,
              ),
              Text(suraList.namaLatin),
              const Spacer(),
              Text(suraList.nama),
            ],
          ),
        ),
      ),
    );
  }
}
