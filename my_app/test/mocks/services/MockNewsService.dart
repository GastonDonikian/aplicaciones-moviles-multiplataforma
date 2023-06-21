import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:my_app/models/news.dart';
import 'package:my_app/services/news_service.dart';

class MockNewsService extends NewsService {
  final collectionPath = 'news';

  final News exampleNews = News(
      id: '1234',
      imagePath: '1234',
      newspaper: 'AS',
      title: 'asdfasdf',
      subtitle: 'asdfasdf',
      text: 'asdfasdf',
      link: 'asdfasdf');

  MockNewsService(super.instance);

  @override
  Future createNews(News news) async {
    return exampleNews;
  }

  @override
  Future<List<News>> getAllNews() async {
    return [exampleNews];
  }

  @override
  Future<News?> getNewsById(String id) async {
    return exampleNews;
  }
}
