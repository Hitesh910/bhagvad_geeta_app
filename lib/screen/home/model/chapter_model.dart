class ChapterModel
{
  int? chapter_number,id;
  String? name;

  ChapterModel({this.chapter_number, this.id, this.name});

  factory ChapterModel.mapToModel(Map m1)
  {
    return ChapterModel(chapter_number: m1['chapter_number'],id: m1['id'],name: m1['name']);
  }
}