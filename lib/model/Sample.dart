part of 'models.dart';

class Sample {
  String name;
  int age;
  List<String> hobi;
  Github github;
  List<Article> articles;
  Map<String, Contact> contact;

  Sample(
      {required this.name,
      required this.age,
      required this.hobi,
      required this.github,
      required this.articles,
      required this.contact});
  @override
  String toString() {
    return 'Sample{name: $name, age: $age, hobi: $hobi, github: $github , articles: $articles, contact: $contact}';
  }

  factory Sample.fromJson(Map<String, dynamic> json) {
    // baca property articles sebagai List (JSON Array)
    var listArticles = json["articles"] as List;
    // mapping listArticles kedalam bentuk MappedIterable<dynamic, Article>
    var iterableArticles = listArticles.map((article) {
      return Article.fromJson(article);
    });
    // lalu, kita konversi dari MappedIterable kedalam bentuk List<Article>
    var articles = List<Article>.from(iterableArticles);

    // baca json object contact
    var mapContact = json["contact"] as Map;
    // lanjut baca isi dari mapContact (json object)
    var mapContactContent = mapContact.map((key, value) {
      return MapEntry<String, Contact>(key,Contact.fromJson(value));
    });

    return Sample(
      name: json["name"],
      age: json["age"],
      hobi: List<String>.from(json["hobi"]),
      github: Github.fromJson(json["github"]),
      articles: articles,
      contact: mapContactContent
    );
  }
}
