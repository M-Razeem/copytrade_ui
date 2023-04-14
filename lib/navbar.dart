import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:copytrade_ui/Navbar/earn.dart';
import 'package:copytrade_ui/Navbar/trades/trades.dart';
import 'package:copytrade_ui/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'Navbar/dash.dart';
import 'futures.dart';
import 'Navbar/home.dart';
import 'main.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key,}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();


}

class _NavbarState extends State<Navbar> {

  int selectedItemIndex = 0;
  List<Widget> widgetOptions = [
  ];
@override
  void initState() {
    get();
    super.initState();
  }
  get() async {
  while(currentUserData.keys.toList().length<2){
    await Future.delayed(Duration(seconds: 1));
  }
    widgetOptions = [
      MyHomePage(traderData: currentUserData,),
      Trades(),
      Earn(),
      Profile(),
    ];
    setState(() {

    });
  }
  void _onItemTap(int index) {
    setState(() {
      selectedItemIndex = index;
    });
  }

  List tabs=[
    {
      "Icon":Icons.home_filled,
      "Name":"Home"
    },
    {
      "Icon":Icons.bar_chart,
      "Name":"Trades"
    },
    {
      "Icon":Icons.attach_money_sharp,
      "Name":"Earn"
    },
    {
      "Icon":Icons.account_circle_sharp,
      "Name":"Account"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:currentUserData.keys.toList().length<2?CircularProgressIndicator(): widgetOptions.elementAt(selectedItemIndex),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Future1(traderData: currentUserData,)));
        },
        child: SvgPicture.asset("assets/logo1.svg"),
        backgroundColor: Colors.black,
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: 4,
        leftCornerRadius: 10,
        rightCornerRadius: 10,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.smoothEdge,
        backgroundColor: darkMode? Theme.of(context).appBarTheme.backgroundColor : Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        onTap: _onItemTap,
        activeIndex: selectedItemIndex,
        tabBuilder: (int index, bool isActive) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                tabs[index]["Icon"]
              ),
              Text(
                tabs[index]["Name"]
              )
            ],
          );
      },
        ),
      );
  }
}
