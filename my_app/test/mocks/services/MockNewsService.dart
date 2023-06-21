import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:my_app/models/news.dart';
import 'package:my_app/services/news_service.dart';

class MockNewsService extends NewsService {
  final collectionPath = 'news';

  final News exampleNews = News(
    id: '1',
    imagePath: 'assets/news_card_1.png',
    newspaper: 'Reporte 2820',
    link: 'www.google.com',
    title: 'Ser Donante Voluntario',
    subtitle: 'Desde el Hospital Centenario recalcan la importancia de la donación voluntaria de Sangre',
    text: 'Desde el Hospital Centenario recalcan la importancia de la donación voluntaria de Sangre. '
        'Desde el Hospital Centenario recalcan la importancia de la donación voluntaria de Sangre. '
        'Desde el Hospital Centenario recalcan la importancia de la donación voluntaria de Sangre. '
        'Desde el Hospital Centenario recalcan la importancia de la donación voluntaria de Sangre',
  );


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
