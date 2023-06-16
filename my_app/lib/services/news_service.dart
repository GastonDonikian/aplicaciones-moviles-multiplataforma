
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/news.dart';


class NewsService {
  final db = FirebaseFirestore.instance;
  final collectionPath = 'news';

  Future createNews(News news) async {
    return db.collection(collectionPath).add(news.toJson());
  }

  Future getAllNews() async {
    return await db.collection(collectionPath).get();
  }
}
