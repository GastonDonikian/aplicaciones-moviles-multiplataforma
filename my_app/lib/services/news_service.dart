import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/news.dart';


class NewsService {
  final db = FirebaseFirestore.instance;
  final collectionPath = 'news';

  Future createNews(News news) async {
    return db.collection(collectionPath).add(news.toJson());
  }

  Future<List<News>> getAllNews() async {
    List<News> news = [];
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('news').get();
      for (var doc in querySnapshot.docs) {
        var data = doc.data() as Map<String, dynamic>;
        var newsItem = News.fromJson(data);
        news.add(newsItem);
      }
    } catch (e) {
      return [];
    }
    return news;
  }

}
