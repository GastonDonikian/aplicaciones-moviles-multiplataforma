class News {
  final String id;
  final String imagePath;
  final String newspaper;
  final String title;
  final String subtitle;
  final String text;
  final String link;

  News({
    required this.id,
    required this.imagePath,
    required this.newspaper,
    required this.title,
    required this.subtitle,
    required this.text,
    required this.link,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imagePath': imagePath,
      'newspaper': newspaper,
      'title': title,
      'subtitle': subtitle,
      'text': text,
      'link': link,
    };
  }

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        id: json['id'],
        imagePath: json['imagePath'],
        newspaper: json['newspaper'],
        title: json['title'],
        subtitle: json['subtitle'],
        text: json['text'],
        link: json['link']);
  }
}
