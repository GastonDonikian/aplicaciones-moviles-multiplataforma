import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:my_app/models/news.dart';
import 'package:my_app/services/news_service.dart';
import 'package:flutter_test/flutter_test.dart';

FakeFirebaseFirestore getInitializedFirestoreInstance() {
  final firestoreInstance = FakeFirebaseFirestore();
  const collectionPath = "news";

  firestoreInstance.collection(collectionPath).doc("doc1").set({
    'date_creation': Timestamp.now(),
    'imagePath': "fakePath.png",
    'newspaper': "Fake Newspaper 1",
    'subtitle': 'Fake Subtitle 1',
    'text': 'Fake Test 1',
    'title': 'Fake Title 1'
  });
  firestoreInstance.collection(collectionPath).doc("doc2").set({
    'date_creation': Timestamp.now(),
    'imagePath': "fakePath.png",
    'newspaper': "Fake Newspaper 2",
    'subtitle': 'Fake Subtitle 2',
    'text': 'Fake Test 2',
    'title': 'Fake Title 2'
  });

  return firestoreInstance;
}

void main() {
  group('News Service', () {
    late NewsService newsService;

    setUp(() {
      newsService = NewsService(getInitializedFirestoreInstance());
    });

    group('constructor', () {
      test(
        'constructor should be not null',
        () {
          expect(NewsService(FakeFirebaseFirestore()), isNotNull);
        },
      );
    });

    group('getNewsById tests', () {
      test(
        'returned value should have title = Fake Title 1',
        () async {
          News? retrievedNews = await newsService.getNewsById("doc1");
          expect(retrievedNews != null, true);
          expect(retrievedNews!.title, "Fake Title 1");
        },
      );
      test(
        'returned value should be null',
        () async {
          News? retrievedNews = await newsService.getNewsById("doc99");
          expect(retrievedNews == null, true);
        },
      );
    });

    group('getAllNews tests', () {
      test(
        'returned values should be two and the first one have title = Fake Title 1',
        () async {
          List<News> retrievedNewsList = await newsService.getAllNews();
          retrievedNewsList.sort((a, b) => a.title.compareTo(b.title));
          expect(retrievedNewsList.length, 2);
          expect(retrievedNewsList[0].title, "Fake Title 1");
        },
      );
    });
  });
}
