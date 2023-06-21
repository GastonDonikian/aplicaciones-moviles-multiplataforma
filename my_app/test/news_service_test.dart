import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:my_app/models/news.dart';
import 'package:my_app/services/news_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final instance = FakeFirebaseFirestore();
  instance.collection("news").doc("doc1").set({
    'date_creation': Timestamp.now(),
    'imagePath': "fakePath.png",
    'link': 'link.com',
    'newspaper': "Fake Newspaper 1",
    'subtitle': 'Fake Subtitle 1',
    'text': 'Fake Test 1',
    'title': 'Fake Title 1'
  });
  instance.collection("news").doc("doc2").set({
    'date_creation': Timestamp.now(),
    'imagePath': "fakePath.png",
    'link': 'link.com',
    'newspaper': "Fake Newspaper 2",
    'subtitle': 'Fake Subtitle 2',
    'text': 'Fake Test 2',
    'title': 'Fake Title 2'
  });

  group('News Services', () {
    test(
        'returned values should be two and the first one have title = Fake Title 1',
        () async {
      List<News> retrievedNewsList = await NewsService(instance).getAllNews();
      retrievedNewsList.sort((a, b) => a.title.compareTo(b.title));
      expect(retrievedNewsList.length, 2);
      expect(retrievedNewsList[0].title, "Fake Title 1");
    });
    test('returned value should have title = Fake Title 1', () async {
      News? retrievedNews = await NewsService(instance).getNewsById("doc1");
      expect(retrievedNews != null, true);
      expect(retrievedNews!.title, "Fake Title 1");
    });
    test('returned value should be null', () async {
      News? retrievedNews = await NewsService(instance).getNewsById("doc99");
      expect(retrievedNews == null, true);
    });
  });
}
