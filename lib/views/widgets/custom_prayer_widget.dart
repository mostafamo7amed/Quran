import 'package:flutter/material.dart';

class PrayerWidget extends StatelessWidget {
  const PrayerWidget({super.key, required this.time, required this.prayer});

  final String? time, prayer;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white30,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Text(
            time??'00:00',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Spacer(),
          Text(
            prayer??'الفجر',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Image.asset(
            'assets/images/ic_praying.png',
            height: 35,
          ),
        ],
      ),
    );
  }
}
