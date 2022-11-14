class Article{
  int id;
  String title;
  String subtitle;

  Article({required this.id,required this.title,required this.subtitle});

  String toString() {
    return "Article {id : $id,title: $title, subtitle: $subtitle}.";
  }
  factory Article.fromJson(Map<String ,dynamic>json){
    return Article(id: json['id'], title: json['title'], subtitle: json['subtitle']);
  }

}