class LibrarySectionModel {
  final String section;
  final String slug;

  LibrarySectionModel({required this.section, required this.slug});

  factory LibrarySectionModel.fromJson(Map<String, dynamic> json) {
    return LibrarySectionModel(section: json['section'] ?? '', slug: json['slug'] ?? '');
  }
}
