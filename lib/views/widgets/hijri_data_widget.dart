import 'package:flutter/material.dart';
import 'package:quran/data/constants/colors.dart';

class HijriData extends StatelessWidget {
  const HijriData(
      {required this.day, required this.month, required this.year, super.key});
  final String? day;
  final String? month;
  final String? year;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: ColorData.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.arrow_back_ios_new,
            color: ColorData.green,
          ),
          const Spacer(),
          Text(
            day ?? '1',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            month ?? "ربيع الثاني",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            '${year ?? '2022'} هـ',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
            color: ColorData.green,
          ),
        ],
      ),
    );
  }
}
