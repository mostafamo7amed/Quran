import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/utils/models/sura.dart' as surah;
import 'package:meta/meta.dart';
import 'package:quran/core/utils/models/surah_details.dart' as surahdetails;
import 'package:quran/core/utils/network/request.dart';

part 'quran_cubit_state.dart';

class QuranCubitCubit extends Cubit<QuranCubitState> {
  QuranCubitCubit() : super(QuranCubitInitial());

  static QuranCubitCubit getCubit(context) => BlocProvider.of(context);

  
  List<surah.Data> sura = [];
  List<surahdetails.Ayat> ayatDetails = [];

  getSurahList() async {
    sura = await getSurah();
    emit(QuranGetSuraState());
  }


  getSurahDetailsList(int index) async {
    ayatDetails = await getSurahDetails(index);
    emit(QuranGetSuraDetailsState());
  }
}
