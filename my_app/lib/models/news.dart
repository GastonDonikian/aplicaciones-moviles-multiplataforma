class News {
  final String imagePath;
  final String newspaper;
  final String title;
  final String subtitle;
  final String text;
  final String link;

  News({
    required this.imagePath,
    required this.newspaper,
    required this.title,
    required this.subtitle,
    required this.text,
    required this.link,
  });
  Map<String, dynamic> toJson() {
    return {
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
      imagePath: json['imagePath'],
      newspaper: json['newspaper'],
      title: json['title'],
      subtitle: json['subtitle'],
      text: json['text'],
      link: json['link']
    );
  }
}
