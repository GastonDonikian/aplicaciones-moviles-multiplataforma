import 'package:flutter/material.dart';
import 'package:my_app/design_system/cells/app_bar.dart';
import 'package:my_app/design_system/cells/cards.dart';
import 'package:my_app/design_system/cells/modal.dart';
import 'package:my_app/design_system/cells/tab_bar.dart';
import 'package:my_app/design_system/tokens/grid_padding.dart';
import 'package:my_app/screens/apply.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  late TabController _tabController;

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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SerManosAppBar(
        customTabBar: SerManosTabBar(tabController: _tabController),
      ),
      body: TabBarView(controller: _tabController, children: [
        ApplyTab(counterFunction: _incrementCounter, counter: _counter),
        const Icon(Icons.directions_transit),
        const Icon(Icons.directions_bike),
      ]),
    );
  }
}
