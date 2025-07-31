class Ayah {
  final int number;
  final String text;
  final String audioUrl;
  final Surah surah;

  Ayah({
    required this.number,
    required this.text,
    required this.audioUrl,
    required this.surah,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) {
    return Ayah(
      number: json['numberInSurah'],
      text: json['text'],
      audioUrl: json['audio'],
      surah: Surah.fromJson(json['surah']),
    );
  }
}

class Surah {
  final int number;
  final String name;
  final String englishName;

  Surah({required this.number, required this.name, required this.englishName});

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      number: json['number'],
      name: json['name'],
      englishName: json['englishName'],
    );
  }
}
