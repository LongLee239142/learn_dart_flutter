import 'package:flutter/material.dart';

import 'my_widgets_01/MyAppBar.dart';
import 'my_widgets_01/MyButton.dart';
import 'my_widgets_01/MyButton_2.dart';
import 'my_widgets_01/MyButton_3.dart';
import 'my_widgets_01/MyColumnAndRow.dart';
import 'my_widgets_01/MyContainer.dart';
import 'my_widgets_01/MyGestures.dart';
import 'my_widgets_01/MyText.dart';
import 'my_widgets_01/MyTextField.dart';
import 'my_widgets_01/MyTextField2.dart';
import 'my_widgets_02_form/f1_form_basic.dart';
import 'my_widgets_02_form/f2_form_TextFormField_Validate.dart';
import 'my_widgets_02_form/f3_form_Dropdown.dart';
import 'my_widgets_02_form/f4_form_RadioListTile.dart';
import 'my_widgets_02_form/f5_form_CheckboxListTile.dart';
import 'my_widgets_02_form/f6_form_DatePicker.dart';
import 'my_widgets_02_form/f7_form_ScrollView.dart';
import 'my_widgets_02_form/f8_form_ImagePicker.dart';
import 'my_widgets_03_listview/f1_listView.dart';
import 'my_widgets_03_listview/f2_gridView.dart';
import 'my_widgets_04_tabBar/f1_tabBar.dart';
import 'my_widgets_05_navigationBar/f1_navigationBar.dart';
import 'my_widgets_06_pageview/f1_pageview.dart';
import 'my_widgets_07_alert_bottomsheet/f1_alertdialog.dart';
import 'my_widgets_07_alert_bottomsheet/f2_bottomsheet.dart';
import 'my_widgets_08_progress_slider_refreshIndicator/f1_progress.dart';
import 'my_widgets_08_progress_slider_refreshIndicator/f2_slider.dart';
import 'my_widgets_08_progress_slider_refreshIndicator/f3_refreshIndicator.dart';
import 'my_widgets_09_materialApp_theme/f1_theme_basic.dart';
import 'my_widgets_09_materialApp_theme/f2_custom_theme.dart';
import 'my_widgets_09_materialApp_theme/f3_dark_light_theme.dart';
import 'navigator/f1_basic_navigation.dart';
import 'navigator/f2_named_routes.dart';
import 'navigator/f3_advanced_navigation.dart';

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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: const MyScaffold(),
      //  home: const MyAppBar(),
      //  home: const Mytext(),
      //  home: const MyContainer(),
      //  home: const MyColumnAndRow(),
      //   home: const MyButton(),
      //   home: const MyButton_2(),
      // home: const MyButton_3(),
      // home: const MyGestures(),
      //  home: const MyTextField(),
      //  home: MyTextField2(),
      //  home: FormBasicDemo(),
      //  home: FormBasicDemo1(),
      //  home: FormBasicDemo2(),
      //   home: FormBasicDemo3(),
      //   home: FormBasicDemo4(),
      //   home: FormBasicDemo5(),
      //    home: FormBasicDemo6(),
      // home: FormBasicDemo7(),
      // home: ListViewDemo(),
      // home: GridViewDemo(),
      // home: NavigationBarMainDemo(), // Uncomment to test Navigation Bar
      // home: PageViewMainDemo(), // Uncomment to test PageView
      //home: TabBarDemo(),
      // home: F1AlertDialog(),
      // home: F2BottomSheet(),
       //home: F1Progress(),
       //home: F2Slider(),
       //home: F3RefreshIndicator(),
       //  home: F1ThemeBasic(),
       //  home: F2CustomTheme(),
       // home: F3DarkLightTheme(),
        //home: F1BasicNavigation(),
        //home: F2NamedRoutes(),
        home: F3AdvancedNavigation(),
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

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

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
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
