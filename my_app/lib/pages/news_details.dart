import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/screens/news.dart';
import 'package:my_app/services/news_service.dart';
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

class DetailedNews extends StatefulWidget {
  const DetailedNews({Key? key, required this.id, required this.maybeNews}) : super(key: key);

  final String id;
  final News? maybeNews;

  static String get routeName => 'news_details';
  static String get routeLocation => 'news_details/:id';

  @override
  State<DetailedNews> createState() => _DetailedNewsState();
}

class _DetailedNewsState extends State<DetailedNews> {
  News? news;

  @override
  void initState() {
    super.initState();
    if (widget.maybeNews == null) {
      loadNews();
    } else {
      setState(() {
        news = widget.maybeNews;
      });
    }
  }

  void loadNews() async {
    final news = await NewsService().getNewsById(widget.id);
    if (news == null) {
      context.goNamed(NewsTab.routeName);
    } else {
      setState(() {
        this.news = news;
      });
    }
  }

  void shareNews() async {
    final urlImage = news!.imagePath;
    final url = Uri.parse(urlImage);
    final response = await http.get(url);
    final bytes = response.bodyBytes;
    final temp = await getTemporaryDirectory();
    final path = '${temp.path}/image.png';
    File(path).writeAsBytes(bytes);
    await FlutterShare.shareFile(
      title: news!.title,
      text: news!.subtitle,
      filePath: path,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SerManosSectionHeader(
        title: 'Novedades',
        body: news == null
            ? const Center(child: CircularProgressIndicator())
            : LayoutBuilder(builder: (context, constraints) {
                return SerManosGridPadding(
                  child: SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 24),
                                child: SerManosTexts.overline(news!.newspaper.toUpperCase(),
                                    color: SerManosColorFoundations.defaultOverlineColor),
                              ),
                              SerManosTexts.headline2(news!.title,
                                  color: SerManosColorFoundations.defaultHeadlineColor),
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: Image.network(
                                          news!.imagePath,
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
                                  child: SerManosTexts.subtitle1(news!.subtitle,
                                      color: SerManosColorFoundations.linkTextColor)),
                              Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: SerManosTexts.body1(news!.text,
                                      color: SerManosColorFoundations.defaultBodyColor)),
                            ],
                          ),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                    padding: const EdgeInsets.only(top: 16),
                                    child: SerManosTexts.headline2('Comparte esta nota',
                                        color: SerManosColorFoundations.defaultHeadlineColor)),
                              ),
                              const SizedBox(height: 16),
                              SerManosElevatedButton(label: 'Compartir', onPressed: shareNews),
                              const SizedBox(height: 32),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }));
  }
}
