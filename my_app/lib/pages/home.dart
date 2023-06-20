import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/design_system/cells/app_bar.dart';
import 'package:my_app/design_system/cells/tab_bar.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/screens/apply.dart';
import 'package:my_app/screens/news.dart';
import 'package:my_app/screens/profile.dart';

class HomePage extends StatefulWidget {
  final String location;
  final Widget child;

  const HomePage({Key? key, required this.location, required this.child}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final tabs = [
    {'path': ApplyTab.routeName, 'title': 'Postularse'},
    {'path': ProfileTab.routeName, 'title': 'Mi perfil'},
    {'path': NewsTab.routeName, 'title': 'Novedades'},
  ];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  void _tap(int index) => context.goNamed(tabs[index]['path']!);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SerManosColorFoundations.scaffoldBackgroundColor,
      appBar: SerManosAppBar(
        customTabBar: SerManosTabBar(
            tabController: _tabController, onPressed: _tap, tabsTitle: tabs.map((t) => t['title']!).toList()),
      ),
      body: widget.child,
    );
  }
}
