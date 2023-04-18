import 'package:flutter/material.dart';

import '../../main.dart';
import 'closed.trades.dart';
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
      extendBody: true,
      extendBodyBehindAppBar: darkMode ? true : false,
      backgroundColor: darkMode ? Colors.transparent : Theme.of(context).scaffoldBackgroundColor,
      body: darkMode ? Container(
        height: MediaQuery.of(context).size.height*1,
        width: MediaQuery.of(context).size.width*1,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/background.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              DefaultTabController(
                  length: 2, // length of tabs
                  initialIndex: 0,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                    Container(
                      color: Colors.transparent,
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
                        height: MediaQuery.of(context).size.height*0.91, //height of TabBarView
                        decoration: BoxDecoration(
                            border: Border(top: BorderSide(color: Colors.transparent, width: 0.5))
                        ),
                        child: TabBarView(children: <Widget>[
                          OpenTrades(traderData: currentUserData,),
                          ClosedTrades()


                        ])
                    )
                  ])
              ),
            ],
          ),
        ),
      ) :
      SafeArea(
        bottom: false,
        child: Column(
          children: [
            DefaultTabController(
                length: 2, // length of tabs
                initialIndex: 0,
                child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                  Container(
                    color: Colors.transparent,
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
                      height: MediaQuery.of(context).size.height*0.91, //height of TabBarView
                      decoration: BoxDecoration(
                          border: Border(top: BorderSide(color: Colors.transparent, width: 0.5))
                      ),
                      child: TabBarView(children: <Widget>[
                        OpenTrades(traderData: currentUserData,),
                        ClosedTrades()


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
