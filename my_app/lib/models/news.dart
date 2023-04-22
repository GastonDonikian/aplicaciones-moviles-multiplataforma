class News {
  final String imagePath;
  final String newspaper;
  final String title;
  final String text;

  News({
    required this.imagePath,
    required this.newspaper,
    required this.title,
    required this.text,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      imagePath: json['imagePath'],
      newspaper: json['newspaper'],
      title: json['title'],
      text: json['text'],
    );
  }
}
