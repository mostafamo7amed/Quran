import 'package:flutter/material.dart';
import 'package:quran/data/constants/colors.dart';
import 'package:quran/data/constants/strings.dart';

class CustomPrayerWidget extends StatelessWidget {
  const CustomPrayerWidget(
      {super.key,
      required this.time,
      required this.prayer,
      required this.color});

  final String? time, prayer;
  final bool color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: color ? ColorData.green : ColorData.white,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            Text(
              time ?? '00:00',
              style: color
                  ? Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: ColorData.white1)
                  : Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
            Text(
              prayer ?? StringData.fajr,
              style: color
                  ? Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: ColorData.white1)
                  : Theme.of(context).textTheme.bodyLarge,
            ),
            Image.asset(
              'assets/images/ic_praying.png',
              height: 30,
              color: color ? ColorData.white1 : ColorData.green,
            ),
          ],
        ),
      ),
    );
  }
}
