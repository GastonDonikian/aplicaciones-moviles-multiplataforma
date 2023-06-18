import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/design_system/cells/cards.dart';
import 'package:my_app/design_system/tokens/grid_padding.dart';
import 'package:my_app/models/news.dart';

class NewsTab extends StatelessWidget {
  const NewsTab({super.key});

  static String get routeName => 'news';
  static String get routeLocation => '/news';

  @override
  Widget build(BuildContext context) {
    List<News> news = [myNews, myNews, myNews, myNews, myNews, myNews, myNews, myNews];

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 32),
            child: ListView.separated(
              itemCount: news.length,
              itemBuilder: (context, index) {
                return SerManosGridPadding(
                  child: SerManosNewsCard(
                    imagePath: news[index].imagePath,
                    cardOverlineText: news[index].newspaper,
                    cardTitle: news[index].title,
                    cardText: news[index].subtitle,
                    onPressed: () {
                      context.goNamed("news_details", extra: news[index], params: {"id": news[index].id});
                    },
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 24),
            ),
          ),
        ),
      ],
    );
  }
}

News myNews = News(
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
