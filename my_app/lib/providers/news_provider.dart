import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/news.dart';

class NewsNotifier extends StateNotifier<News?> {
  NewsNotifier() : super(null) {}
}