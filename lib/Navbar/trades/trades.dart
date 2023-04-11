import 'package:flutter/material.dart';

import '../../main.dart';
import 'open.trades.dart';

class Trades extends StatefulWidget {
  const Trades({Key? key}) : super(key: key);

  @override
  State<Trades> createState() => _TradesState();
}

class _TradesState extends State<Trades> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            DefaultTabController(
                length: 2, // length of tabs
                initialIndex: 0,
                child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                  Container(
                    child: TabBar(
                      unselectedLabelColor: Theme.of(context).shadowColor,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: Theme.of(context).textTheme.bodyLarge?.color,
                      indicatorColor: Theme.of(context).textTheme.bodyLarge?.color,
                      labelStyle: TextStyle(fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                      tabs: [
                        Tab(text: 'OPEN'),
                        Tab(text: 'CLOSED'),
                      ],
                    ),
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height-240, //height of TabBarView
                      decoration: BoxDecoration(
                          border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                      ),
                      child: TabBarView(children: <Widget>[
                        OpenTrades(),
                        Container(
                          child: Center(
                            child: Text('Display Tab 2', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                          ),
                        ),

                      ])
                  )
                ])
            ),
          ],
        ),
      ),
    );
  }
}
