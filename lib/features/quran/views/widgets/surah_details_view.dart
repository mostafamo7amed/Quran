import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/utils/constants/colors.dart';
import 'package:quran/core/utils/models/sura.dart' as Surah;
import 'package:quran/features/quran/view_models/cubit/quran_cubit_cubit.dart';
import 'package:quran/features/quran/views/widgets/surah_item.dart';

class SurahDetailsView extends StatefulWidget {
  const SurahDetailsView({super.key, required this.surah,required this.index});
  final Surah.Data surah;
  final int index;

  @override
  State<SurahDetailsView> createState() => _SurahDetailsViewState();
}

class _SurahDetailsViewState extends State<SurahDetailsView> {
  @override
  void initState() {
    QuranCubitCubit.getCubit(context).getSurahDetailsList(widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranCubitCubit, QuranCubitState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        var cubit = QuranCubitCubit.getCubit(context);
        return cubit.ayatDetails.isNotEmpty? Scaffold(
          appBar: AppBar(
            title: Text(
              widget.surah.nama,
              style: const TextStyle(color: ColorData.white1),
            ),
          ),
          body: ListView.separated(
              itemBuilder: (context, index) =>
                  SurahItem(ayat: cubit.ayatDetails[index]),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 2,
                  ),
              itemCount: cubit.ayatDetails.length),
        ):CircularProgressIndicator();
      },
    );
  }
}
