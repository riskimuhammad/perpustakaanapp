class DBBookModel {
  String? codeBook;
  String? title;
  String? description;
  String? categpry;

  DBBookModel(this.codeBook, this.description, this.title, this.categpry);

  DBBookModel.fromJson(dynamic json) {
    codeBook = json['book_code'];
    description = json['description'];
    title = json['title'];
    categpry = json['category'];
  }

  Map<String, Object> toJson() {
    final Map<String, Object> data = new Map<String, Object>();

    return data;
  }
}
