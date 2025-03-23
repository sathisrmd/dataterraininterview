import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_echarts/flutter_echarts.dart';
// import 'package:number_display/number_display.dart';


import 'gl_script.dart' show glScript;

// final display = createDisplay(decimal: 2);



class ChartPage extends StatefulWidget {
  ChartPage({Key? key}) : super(key: key);

  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<Map<String, Object>> _data1 = [
    {'name': 'Please wait', 'value': 0}
  ];

  getData1() async {
    await Future.delayed(Duration(seconds: 4));

    const dataObj = [
      {
        'name': 'Jan',
        'value': 8726.2453,
      },
      {
        'name': 'Feb',
        'value': 2445.2453,
      },
      {
        'name': 'Mar',
        'value': 6636.2400,
      },
      {
        'name': 'Apr',
        'value': 4774.2453,
      },
      {
        'name': 'May',
        'value': 1066.2453,
      },
      {
        'name': 'Jun',
        'value': 4576.9932,
      },
      {
        'name': 'Jul',
        'value': 8926.9823,
      }
    ];

    this.setState(() {
      this._data1 = dataObj;
    });
  }

  @override
  void initState() {
    super.initState();

    this.getData1();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Echarts Demon'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                child: Text('Program Status Metrics',
                    style: TextStyle(fontSize: 20)),
                padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
              ),
              // Text('- chart capture all gestures'),
              Container(
                child: Echarts(
                  extensions: [glScript],
                  captureAllGestures: true,
                  option: '''
                    {
                    color: ['#C7DEFF', '#7E9FD4', '#1D5BBF'],  // Custom colors for each series
  legend: { orient: 'horizontal',  // Ensures legends are in a row
    bottom: 0   },
  tooltip: {},
  dataset: {
    source: [
      ['product', 'All Programs', 'Active', 'Completed'],
      ['Jan', 10, 8, 30],
      ['Feb', 30, 45, 45],
      ['Mar', 50, 30, 50],
     
    ]
  },
  xAxis: { type: 'category' },
  yAxis: {},
  // Declare several bar series, each will be mapped
  // to a column of dataset.source by default.
  series: [{ type: 'bar' }, { type: 'bar' }, { type: 'bar' }]
}
                  ''',
                ),
                width: 300,
                height: 250,
              ),

            ],
          ),
        ),
      ),
    );
  }
}