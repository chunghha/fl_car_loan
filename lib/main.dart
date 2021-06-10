import 'package:flutter/material.dart';

import 'constants.dart';
import 'pages/maximum_loan.page.dart';
import 'pages/monthly_cost.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Loan Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            shadowColor: Colors.blueGrey[800],
            bottom: TabBar(
              indicatorColor: Colors.blueGrey[100],
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: Colors.blueGrey[100]!,
                  width: defaultBorderWidth,
                ),
                insets: EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                ),
              ),
              tabs: [
                Tab(text: 'Monthly Cost'),
                Tab(text: 'Maximum Loan'),
              ],
            ),
            title: Text('Car Loan Calculator'),
          ),
          body: TabBarView(
            children: [
              MonthlyCostPage(),
              MaximumLoanPage(),
            ],
          ),
        ),
      ),
    );
  }
}
