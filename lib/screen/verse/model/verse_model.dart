class VerseModel {
  String? verse;
  int? id, verse_number, chapter_number;
  bool? isFav = false;

  VerseModel(
      {this.verse,
      this.id,
      this.verse_number,
      this.chapter_number,
      this.isFav=false});

  factory VerseModel.mapToModel(Map m1) {
    return VerseModel(
        verse: m1['text'],
        id: m1['id'],
        verse_number: m1['verse_number'],
        chapter_number: m1['chapter_number']);
  }
}
