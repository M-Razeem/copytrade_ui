import 'package:copytrade_ui/Navbar/earn.dart';
import 'package:copytrade_ui/Navbar/menu.dart';
import 'package:copytrade_ui/traders.dart';
import 'package:copytrade_ui/wallet.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'Navbar/futures.dart';
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
    MyHomePage(),
    Future1(),
    Earn(),
    Menu(),
  ];

  void _onItemTap(int index) {
    setState(() {
      selectedItemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(selectedItemIndex),
      ),
      bottomNavigationBar: StylishBottomBar(
        items: [
            BottomBarItem(
              icon: Icon(Icons.home_filled,),
              title: Text("Home",style: TextStyle(fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize),),
              selectedColor: Theme.of(context).splashColor,
              unSelectedColor: Colors.grey,
            ),
            BottomBarItem(
              icon: Icon(Icons.bar_chart,),
              title: Text("Futures",style: TextStyle(fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize),),
              selectedColor: Theme.of(context).splashColor,
              unSelectedColor: Colors.grey,
            ),
            BottomBarItem(
              icon: Icon(Icons.attach_money_sharp),
              title: Text("Earn",style: TextStyle(fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize),),
              selectedColor: Theme.of(context).splashColor,
              unSelectedColor: Colors.grey,
            ),
            BottomBarItem(
              icon: Icon(Icons.menu,),
              title: Text("Menu",style: TextStyle(fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,),),
              selectedColor: Theme.of(context).splashColor,
              unSelectedColor: Colors.grey,
            ),
          ],
        backgroundColor: darkMode? Theme.of(context).appBarTheme.backgroundColor : Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        onTap: _onItemTap,
        currentIndex: selectedItemIndex,
        option: AnimatedBarOptions(
          barAnimation: BarAnimation.fade,
          iconStyle: IconStyle.Default,
        ),
        ),
      );
  }
}
