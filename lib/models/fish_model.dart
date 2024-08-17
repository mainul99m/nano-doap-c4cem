import 'package:nano_doap_c4cem/main.dart';

class Fish{
  Fish({
    this.species,
    required this.commonName,
    this.bengaliName,
    this.IUCN
  });

  String? species;
  String commonName;
  String? bengaliName;
  String? IUCN;



  String getLocalName(){
    if (selectedLanguageCode == 'bn_BD') return bengaliName ?? commonName;
    return commonName;
  }
}