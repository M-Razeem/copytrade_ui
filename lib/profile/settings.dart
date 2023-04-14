import 'package:copytrade_ui/lists.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Settings1 extends StatefulWidget {
  const Settings1({Key? key}) : super(key: key);

  @override
  State<Settings1> createState() => _Settings1State();
}

class _Settings1State extends State<Settings1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: darkMode? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).scaffoldBackgroundColor,
        elevation: Theme.of(context).appBarTheme.elevation,
        toolbarHeight: MediaQuery.of(context).size.height*0.02,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width*0.03,
              ),
              Text(
                "Settings",
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                  color: Theme.of(context).textTheme.titleMedium?.color
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.03,
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.6,
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: setting.length,
                itemBuilder: (context,index){
                  return Column(
                    children: [
                      ListTile(
                        leading: Text(
                          setting[index]["Name"],
                          style: TextStyle(
                            fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                            color: Theme.of(context).textTheme.titleSmall?.color,
                          ),
                        ),
                        trailing:
                            setting[index]["Icon"],
                      ),
                      Divider(
                        indent: MediaQuery.of(context).size.width*0.07,
                        endIndent: MediaQuery.of(context).size.width*0.07,
                        color: Theme.of(context).highlightColor,
                        thickness: 1,
                      ),
                    ],
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}
