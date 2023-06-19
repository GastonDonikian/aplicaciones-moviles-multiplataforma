import 'package:flutter_share/flutter_share.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:my_app/design_system/cells/headers.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/design_system/molecules/buttons.dart';
import 'package:my_app/design_system/tokens/grid_padding.dart';
import 'package:http/http.dart' as http;

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
              const SizedBox(height: 16),
              SerManosElevatedButton(
                label: 'Compartir',
                onPressed: () async {
                  final urlImage =
                      'https://firebasestorage.googleapis.com/v0/b/sermanos-f8b2f.appspot.com/o/volunteer_association_images%2FImagen.png?alt=media&token=2cce6365-a8ac-4bf1-b9e0-4b6aa52bf8e7';
                  final url = Uri.parse(urlImage);
                  final response = await http.get(url);
                  final bytes = response.bodyBytes;
                  final temp = await getTemporaryDirectory();
                  final path = '${temp.path}/image.png';
                  File(path).writeAsBytes(bytes);
                  await FlutterShare.shareFile(
                    title: news.title,
                    text: news.subtitle,
                    filePath: path,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
