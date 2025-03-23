import 'package:dataterrain/app_export.dart';
import 'package:dataterrain/views/dashboard_view_mobile.dart';
import 'package:dataterrain/views/dashboard_view_tablet.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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

    return ScreenTypeLayout.builder(
      breakpoints: ScreenBreakpoints(desktop: 900, tablet: 650, watch: 250),
      mobile: (_) => DashboardViewMobile(),
      tablet: (_) => DashboardViewTablet(),
    );
  }
}