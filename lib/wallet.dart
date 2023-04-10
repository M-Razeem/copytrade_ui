import 'package:flutter/material.dart';

import 'main.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: darkMode ? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).scaffoldBackgroundColor,
        elevation: Theme.of(context).appBarTheme.elevation,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Futures Wallet",
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
              color: Theme.of(context).textTheme.titleSmall?.color,
              fontWeight: FontWeight.w600
          ),
        ),
      ),
      body: darkMode? SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.5,
              width: MediaQuery.of(context).size.width*1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40)
                ),
                color: Theme.of(context).appBarTheme.backgroundColor,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.03,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.06,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height*0.032,
                        width: MediaQuery.of(context).size.width*0.2,
                        decoration: BoxDecoration(
                          color: Theme.of(context).shadowColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "USD-M",
                            style: TextStyle(
                              color: Theme.of(context).textTheme.bodyLarge?.color,
                              fontWeight: FontWeight.w600,
                              fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ) :
      SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      )
    );
  }
}
