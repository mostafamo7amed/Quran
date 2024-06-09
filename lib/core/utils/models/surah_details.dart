import 'dart:convert';

class SurahDetails {
    int code;
    String message;
    Data data;

    SurahDetails({
        required this.code,
        required this.message,
        required this.data,
    });

    factory SurahDetails.fromJson(String str) => SurahDetails.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory SurahDetails.fromMap(Map<String, dynamic> json) => SurahDetails(
        code: json["code"],
        message: json["message"],
        data: Data.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "data": data.toMap(),
    };
}

class Data {
    int nomor;
    String nama;
    String namaLatin;
    int jumlahAyat;
    String tempatTurun;
    String arti;
    String deskripsi;
    Map<String, String> audioFull;
    List<Ayat> ayat;
    //SuratSenya suratSelanjutnya;
    //SuratSenya suratSebelumnya;

    Data({
        required this.nomor,
        required this.nama,
        required this.namaLatin,
        required this.jumlahAyat,
        required this.tempatTurun,
        required this.arti,
        required this.deskripsi,
        required this.audioFull,
        required this.ayat,
        //required this.suratSelanjutnya,
        //required this.suratSebelumnya,
    });

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["namaLatin"],
        jumlahAyat: json["jumlahAyat"],
        tempatTurun: json["tempatTurun"],
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audioFull: Map.from(json["audioFull"]).map((k, v) => MapEntry<String, String>(k, v)),
        ayat: List<Ayat>.from(json["ayat"].map((x) => Ayat.fromMap(x))),
        //suratSelanjutnya: SuratSenya.fromMap(json["suratSelanjutnya"]),
        //suratSebelumnya: SuratSenya.fromMap(json["suratSebelumnya"]),
    );

    Map<String, dynamic> toMap() => {
        "nomor": nomor,
        "nama": nama,
        "namaLatin": namaLatin,
        "jumlahAyat": jumlahAyat,
        "tempatTurun": tempatTurun,
        "arti": arti,
        "deskripsi": deskripsi,
        "audioFull": Map.from(audioFull).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "ayat": List<dynamic>.from(ayat.map((x) => x.toMap())),
        //"suratSelanjutnya": suratSelanjutnya.toMap(),
        //"suratSebelumnya": suratSebelumnya.toMap(),
    };
}

class Ayat {
    int nomorAyat;
    String teksArab;
    String teksLatin;
    String teksIndonesia;
    Map<String, String> audio;

    Ayat({
        required this.nomorAyat,
        required this.teksArab,
        required this.teksLatin,
        required this.teksIndonesia,
        required this.audio,
    });

    factory Ayat.fromJson(String str) => Ayat.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Ayat.fromMap(Map<String, dynamic> json) => Ayat(
        nomorAyat: json["nomorAyat"],
        teksArab: json["teksArab"],
        teksLatin: json["teksLatin"],
        teksIndonesia: json["teksIndonesia"],
        audio: Map.from(json["audio"]).map((k, v) => MapEntry<String, String>(k, v)),
    );

    Map<String, dynamic> toMap() => {
        "nomorAyat": nomorAyat,
        "teksArab": teksArab,
        "teksLatin": teksLatin,
        "teksIndonesia": teksIndonesia,
        "audio": Map.from(audio).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}

// class SuratSenya {
//     int nomor;
//     String nama;
//     String namaLatin;
//     int jumlahAyat;

//     SuratSenya({
//         required this.nomor,
//         required this.nama,
//         required this.namaLatin,
//         required this.jumlahAyat,
//     });

//     factory SuratSenya.fromJson(String str) => SuratSenya.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory SuratSenya.fromMap(Map<String, dynamic> json) => SuratSenya(
//         nomor: json["nomor"],
//         nama: json["nama"],
//         namaLatin: json["namaLatin"],
//         jumlahAyat: json["jumlahAyat"],
//     );

//     Map<String, dynamic> toMap() => {
//         "nomor": nomor,
//         "nama": nama,
//         "namaLatin": namaLatin,
//         "jumlahAyat": jumlahAyat,
//     };
// }
