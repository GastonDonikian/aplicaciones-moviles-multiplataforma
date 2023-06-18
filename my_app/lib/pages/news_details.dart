import 'package:flutter/cupertino.dart';
import 'package:my_app/design_system/cells/headers.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/design_system/molecules/buttons.dart';
import 'package:my_app/design_system/tokens/grid_padding.dart';
import 'package:url_launcher/url_launcher.dart';

import '../design_system/foundations/texts.dart';
import '../models/news.dart';

class DetailedNews extends StatelessWidget {
  const DetailedNews({Key? key, required this.id, required this.news}) : super(key: key);

  final String id;
  final News news;

  static String get routeName => 'news_details';
  static String get routeLocation => 'news_details/:id';

  @override
  Widget build(BuildContext context) {
    return SerManosSectionHeader(
      title: 'Novedades',
      body: SingleChildScrollView(
        child: SerManosGridPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: SerManosTexts.overline(news.newspaper.toUpperCase(),
                    color: SerManosColorFoundations.defaultOverlineColor),
              ),
              SerManosTexts.headline2(news.title, color: SerManosColorFoundations.defaultHeadlineColor),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image(
                          image: AssetImage(news.imagePath),
                          fit: BoxFit.fill,
                          height: 160,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: SerManosTexts.subtitle1(news.subtitle, color: SerManosColorFoundations.linkTextColor)),
              Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: SerManosTexts.body1(news.text, color: SerManosColorFoundations.defaultBodyColor)),
              Align(
                alignment: Alignment.center,
                child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: SerManosTexts.headline2('Comparte esta nota',
                        color: SerManosColorFoundations.defaultHeadlineColor)),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    //TODO : Sendo to link
                    child: SerManosElevatedButton(
                      label: 'Compartir',
                      disabled: false,
                      onPressed: () async {
                        final url = 'https://www.google.com';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
