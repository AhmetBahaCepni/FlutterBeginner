import 'package:quiz/soru.dart';

class TestVeri {
  int _soruNumarasi = 0;

  List<Soru> _soruListesi = [
    Soru(
        soruMetni: "Titanic gelmiş geçmiş en büyük gemidir", soruYaniti: false),
    Soru(
        soruMetni: "Dünyadaki tavuk sayısı insan sayısından fazladır",
        soruYaniti: true),
    Soru(soruMetni: "Kelebeklerin ömrü bir gündür", soruYaniti: false),
    Soru(soruMetni: "Dünya düzdür", soruYaniti: false),
    Soru(
        soruMetni: "Kaju fıstığı aslında bir meyvenin sapıdır",
        soruYaniti: true),
    Soru(
        soruMetni: "Fatih Sultan Mehmet hiç patates yememiştir",
        soruYaniti: true),
    Soru(soruMetni: "Thanks For PLAYING!", soruYaniti: true),
  ];

  String getSoruMetni() {
    return _soruListesi[_soruNumarasi].soruMetni;
  }

  bool getSoruYaniti() {
    return _soruListesi[_soruNumarasi].soruYaniti;
  }

  bool isValid() {
    if (_soruNumarasi < _soruListesi.length - 1) {
      _soruNumarasi++;
      return true;
    } else
      return false;
  }
}
