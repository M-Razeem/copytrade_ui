import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'main.dart';

class ConnectExchange extends StatefulWidget {
  const ConnectExchange({Key? key}) : super(key: key);

  @override
  State<ConnectExchange> createState() => _ConnectExchangeState();
}

class _ConnectExchangeState extends State<ConnectExchange> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: darkMode? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).scaffoldBackgroundColor,
        elevation: Theme.of(context).appBarTheme.elevation,
        automaticallyImplyLeading: false,
        toolbarHeight: MediaQuery.of(context).size.height*0.022,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.0485,
              width: MediaQuery.of(context).size.width*1,
              color: darkMode? Color(0xff394754) : Theme.of(context).shadowColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.044),
                    child: Text(
                      "CONNECT WITH EXCHANGE",
                      style: TextStyle(
                        fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                        fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight,
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close_sharp,
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                      )
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.012,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.044,
                ),
                Text(
                  "Exchange",
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.006,
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.036,
              width: MediaQuery.of(context).size.width*0.918,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                color: darkMode? Color(0xff394754) : Theme.of(context).shadowColor,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.028,
                  ),
                  Image(
                    image: AssetImage(
                        "assets/binance.png"
                    ),
                    height: MediaQuery.of(context).size.height*0.018,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.0224,
                  ),
                  Text(
                      "BINANCE FUTURES",
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                      fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight,
                      color: Theme.of(context).textTheme.bodySmall?.color,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.54,
                  ),
                  SvgPicture.asset(
                    "assets/link.svg"
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.014,
            ),
            Text(
              "How do I create an API on Binance Futures",
              style: TextStyle(
                color: Theme.of(context).splashColor,
                fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
