class Article {
  final int id;

  final String title;

  final String image;

  final String summary;

  final String newsSite;

  Article({
    required this.id,

    required this.title,

    required this.image,

    required this.summary,

    required this.newsSite,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],

      title: json['title'],

      image: json['image_url'],

      summary: json['summary'],

      newsSite: json['news_site'],
    );
  }
}
