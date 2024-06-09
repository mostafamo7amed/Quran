import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/utils/constants/colors.dart';
import 'package:quran/features/quran/view_models/cubit/quran_cubit_cubit.dart';
import 'package:quran/features/quran/views/widgets/quran_item.dart';

class QuranWidget extends StatelessWidget {
  const QuranWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranCubitCubit, QuranCubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = QuranCubitCubit.getCubit(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Quran',
              style: TextStyle(color: ColorData.white1),
            ),
          ),
          body: ListView.separated(
              itemBuilder: (context, index) => QuranItem(
                    suraList: cubit.sura[index],
                    index: index+1,
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 2,
                  ),
              itemCount: cubit.sura.length),
        );
      },
    );
  }
}
