import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/news.dart';

class NewsService {
  final collectionPath = 'news';
  FirebaseFirestore? instance;

  NewsService([this.instance]) {
    if (instance == null) {
      instance = FirebaseFirestore.instance;
    } else {
      instance = instance;
    }
  }

  Future createNews(News news) async {
    return instance!.collection(collectionPath).add(news.toJson());
  }

  Future<List<News>> getAllNews() async {
    List<News> news = [];
    try {
      QuerySnapshot querySnapshot = await instance!
          .collection(collectionPath)
          .orderBy('date_creation', descending: true)
          .get();
      for (var doc in querySnapshot.docs) {
        var data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;
        var newsItem = News.fromJson(data);
        news.add(newsItem);
      }
    } catch (e) {
      return [];
    }
    return news;
  }

  Future<News?> getNewsById(String id) async {
    try {
      DocumentSnapshot documentSnapshot =
          await instance!.collection(collectionPath).doc(id).get();
      var data = documentSnapshot.data() as Map<String, dynamic>;
      data['id'] = documentSnapshot.id;
      var newsItem = News.fromJson(data);
      return newsItem;
    } catch (e) {
      return null;
    }
  }
}
