class ChapterModel
{
  int? chapter_number,id,verse;
  String? name,chapter_summary;

  ChapterModel({this.chapter_number, this.id, this.name,this.verse,this.chapter_summary});

  factory ChapterModel.mapToModel(Map m1)
  {
    return ChapterModel(chapter_number: m1['chapter_number'],id: m1['id'],name: m1['name'],verse: m1['verses_count'],chapter_summary: m1['chapter_summary_hindi']);
  }
}