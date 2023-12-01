class Author {
  final String id;
  final String name;

  Author({
    required this.id,
    required this.name,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Article {
  final String? id;
  final String? body;
  final String? title;
  final String? slug;
  final String? imageUrl;
  final String? createdAt;
  final String? updatedAt;
  final String? jenispost;
  final String? category;
  final Author? author;
  final int? counter;

  final List<Map<String, String>>? categories;

  Article({
    this.id,
    this.title,
    this.slug,
    this.imageUrl,
    this.body,
    this.createdAt,
    this.updatedAt,
    this.categories,
    this.jenispost,
    this.category,
    this.author,
    this.counter,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      author: json['author'] != null ? Author.fromJson(json['author']) : null,
      createdAt: json['createdAt'] ?? '',
      imageUrl: json['imageUrl'],
      updatedAt: json['updatedAt'],
      jenispost: json['jenispost'],
      categories: (json['categories'] as List<dynamic>)
          .map((category) => Map<String, String>.from(category))
          .toList(),
      body: json['body'],
      slug: json['slug'],
      counter: json['counter'],
    );
  }
}
