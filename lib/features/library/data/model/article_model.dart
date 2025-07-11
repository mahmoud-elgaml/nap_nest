class ArticleModel {
  final int id;
  final String title;
  final String description;
  final String content;
  final String tagline;
  final String section;

  ArticleModel({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.tagline,
    required this.section,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      content: json['content'],
      tagline: json['tagline'] ?? '',
      section: json['section'] ?? '',
    );
  }
}
