import 'package:flutter/material.dart';
import 'package:quran/data/constants/colors.dart';
import 'package:quran/data/providers/cubit/home_view_cubit_cubit.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key, required this.cubit});
  final HomeViewCubitCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: ColorData.grey.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 5,
          ),
          Text(cubit.prayerTime.data!.meta!.timezone!,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: ColorData.white1)),
          const SizedBox(
            width: 5,
          ),
          const Icon(
            Icons.location_on_outlined,
            color: ColorData.white1,
          ),
        ],
      ),
    );
  }
}
