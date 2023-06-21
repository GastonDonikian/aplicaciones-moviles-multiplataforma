import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:my_app/models/news.dart';
import 'package:my_app/services/news_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('News Service', () {
    late NewsService newsService;
    final firestoreInstance = FakeFirebaseFirestore();
    firestoreInstance.collection("news").doc("doc1").set({
      'date_creation': Timestamp.now(),
      'imagePath': "fakePath.png",
      'link': 'link.com',
      'newspaper': "Fake Newspaper 1",
      'subtitle': 'Fake Subtitle 1',
      'text': 'Fake Test 1',
      'title': 'Fake Title 1'
    });
    firestoreInstance.collection("news").doc("doc2").set({
      'date_creation': Timestamp.now(),
      'imagePath': "fakePath.png",
      'link': 'link.com',
      'newspaper': "Fake Newspaper 2",
      'subtitle': 'Fake Subtitle 2',
      'text': 'Fake Test 2',
      'title': 'Fake Title 2'
    });

    setUp(() {
      newsService = NewsService(firestoreInstance);
    });

    group('constructor', () {
      test('constructor should be not null', () {
        expect(NewsService(firestoreInstance), isNotNull);
      });
    });

    group('gestNewsById tests', () {
      test('returned value should have title = Fake Title 1', () async {
        News? retrievedNews = await newsService.getNewsById("doc1");
        expect(retrievedNews != null, true);
        expect(retrievedNews!.title, "Fake Title 1");
      });
      test('returned value should be null', () async {
        News? retrievedNews = await newsService.getNewsById("doc99");
        expect(retrievedNews == null, true);
      });
    });

    group('getAllNews tests', () {
      test(
          'returned values should be two and the first one have title = Fake Title 1',
          () async {
        List<News> retrievedNewsList = await newsService.getAllNews();
        retrievedNewsList.sort((a, b) => a.title.compareTo(b.title));
        expect(retrievedNewsList.length, 2);
        expect(retrievedNewsList[0].title, "Fake Title 1");
      });
    });
  });
}
