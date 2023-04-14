import 'package:flutter/material.dart';
import 'package:my_app/design_system/atoms/icons.dart';
import 'package:my_app/design_system/atoms/logo.dart';
import 'package:my_app/design_system/cells/app_bar.dart';
import 'package:my_app/design_system/cells/cards.dart';
import 'package:my_app/design_system/cells/tab_bar.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/design_system/molecules/buttons.dart';
import 'package:my_app/design_system/tokens/grid_padding.dart';
import 'design_system/molecules/inputs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: SerManosColorFoundations.getMaterialColor(
            SerManosColorFoundations.statusBarColor),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
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
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: SerManosAppBar(
        customTabBar: SerManosTabBar(tabController: _tabController),
      ),
      body: TabBarView(controller: _tabController, children: [
        TestTab(counterFunction: _incrementCounter, counter: _counter),
        const Icon(Icons.directions_transit),
        const Icon(Icons.directions_bike),
      ]),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//ONLY FOR TESTING PURPOSE, will be deleted later
class TestTab extends StatelessWidget {
  TestTab({super.key, required this.counterFunction, required this.counter});

  void Function()? counterFunction;
  int counter;

  @override
  Widget build(BuildContext context) {
    return SerManosGridPadding(
        child: Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: Column(
        // Column is also a layout widget. It takes a list of children and
        // arranges them vertically. By default, it sizes itself to fit its
        // children horizontally, and tries to be as tall as its parent.
        //
        // Invoke "debug painting" (press "p" in the console, choose the
        // "Toggle Debug Paint" action from the Flutter Inspector in Android
        // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
        // to see the wireframe for each widget.
        //
        // Column has various properties to control how it sizes itself and
        // how it positions its children. Here we use mainAxisAlignment to
        // center the children vertically; the main axis here is the vertical
        // axis because Columns are vertical (the cross axis would be
        // horizontal).
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SerManosVolunteerCard(
              imagePath: 'assets/volunteer_card_1.png',
              cardOverlineText: 'Accion Social',
              cardText: 'Un Techo Para mi Pais'),
          // const Text(
          //   'You have pushed the button this many times:',
          // ),
          // Text(
          //   '$counter',
          //   style: Theme.of(context).textTheme.headlineMedium,
          // ),
          // const CustomInput(
          //     placeholder: 'Placeholder',
          //     label: 'Label',
          //     errorText: 'ErrorText',
          //     errorIcon: SerManosIcons.errorIcon,
          //     eraseIcon: SerManosIcons.closeIcon,
          //     defaultIcon: SerManosIcons.searchIcon),
          // SerManosIconTextButton(
          //     label: "Press me",
          //     buttonIcon: SerManosIcons.addIcon,
          //     onPressed: counterFunction),
          // SerManosElevatedButton(
          //     label: "Press me too", onPressed: counterFunction),
          // SerManosTextButton(
          //     label: "And press me too", onPressed: counterFunction)
        ],
      ),
    ));
  }
}
