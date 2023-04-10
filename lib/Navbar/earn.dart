import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

import '../main.dart';

class Earn extends StatefulWidget {
  const Earn({Key? key}) : super(key: key);

  @override
  State<Earn> createState() => _EarnState();
}

class _EarnState extends State<Earn> {
  @override
  Widget build(BuildContext context) {
    print(currentUserId);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: darkMode ? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).scaffoldBackgroundColor,
        elevation: Theme.of(context).appBarTheme.elevation,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "SKOL Referral Program",
          style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).textTheme.titleLarge?.color,
              fontWeight: FontWeight.w400
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.04),
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.65,
                        color: Colors.transparent,
                        child: Text(
                          "User ID:\n" + currentUserId.toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight,
                            fontSize: 11,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.01,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.02,
                        width: MediaQuery.of(context).size.width * 0.65,
                        color: Colors.transparent,
                        child: Text(
                          "Ref. Code: ",
                          style: TextStyle(
                            fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.02),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.045,
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).shadowColor,
                      ),
                      child: Center(
                        child: Text(
                          "Refer",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.13,
                  width: MediaQuery.of(context).size.width * 0.26,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Theme.of(context).shadowColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "121",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "TOTAL MEMBERS",
                        style: TextStyle(
                            fontSize:
                                Theme.of(context).textTheme.bodySmall?.fontSize,
                            fontWeight: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.fontWeight),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.13,
                  width: MediaQuery.of(context).size.width * 0.26,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Theme.of(context).shadowColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "1000 USDT",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "TOTAL EARNINGS",
                        style: TextStyle(
                            fontSize:
                                Theme.of(context).textTheme.bodySmall?.fontSize,
                            fontWeight: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.fontWeight),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.13,
                  width: MediaQuery.of(context).size.width * 0.26,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Theme.of(context).shadowColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "100",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "ACTIVE MEMBERS",
                        style: TextStyle(
                            fontSize:
                                Theme.of(context).textTheme.bodySmall?.fontSize,
                            fontWeight: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.fontWeight),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            FlutterCarousel.builder(
              options: CarouselOptions(
                viewportFraction: 0.8,
                height: MediaQuery.of(context).size.height * 0.18,
                enableInfiniteScroll: true,
                floatingIndicator: false,
                slideIndicator: CircularSlideIndicator(
                    currentIndicatorColor: Theme.of(context).splashColor,
                    indicatorRadius: 3),
              ),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Padding(
                  padding: const EdgeInsets.only(right: 5, left: 5),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(image: AssetImage("assets/bitcoin.webp"),fit: BoxFit.cover),
                        gradient: LinearGradient(colors: [
                          Color(0xff404F4C),
                          Color(0xff364353),
                        ])),
                  ),
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Text(
              "Your SKOL Team",
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.95,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).shadowColor, width: 3)),
              child: DataTable2(
                columnSpacing: 0.4,
                dividerThickness: 3,
                horizontalMargin: 5,
                columns: [
                  DataColumn2(
                    label: Text(
                      'Levels',
                      style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.bodySmall?.fontSize),
                    ),
                    fixedWidth: 46
                  ),
                  DataColumn2(
                    label: Text(
                      'Joinees',
                      style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.bodySmall?.fontSize),
                    ),
                    fixedWidth: 46
                  ),
                  DataColumn2(
                    label: Text(
                      'Referral\n'
                      'Income',
                      style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.bodySmall?.fontSize),
                    ),
                    fixedWidth: 46
                  ),
                  DataColumn2(
                    label: Text(
                      'Trading\nCommission',
                      style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.bodySmall?.fontSize),
                    ),
                    fixedWidth: 64
                  ),
                  DataColumn2(
                    label: Text(
                      'Last Month\nReferral',
                      style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.bodySmall?.fontSize),
                    ),
                    fixedWidth: 60
                  ),
                  DataColumn(
                    label: Text(
                      'Last Month\nTrading Commission',
                      style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.bodySmall?.fontSize),
                    ),
                  ),
                ],
                rows: List<DataRow>.generate(
                  2,
                  (index) => DataRow(
                    cells: [
                      DataCell(
                        Text('Level 1'),
                      ),
                      DataCell(Text('12')),
                      DataCell(Text('****')),
                      DataCell(Text('****')),
                      DataCell(Text('****')),
                      DataCell(Text('****')),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.06,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "Cumulative Referral\nIncome",
                      style: TextStyle(
                          fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                          fontWeight: Theme.of(context).textTheme.bodyMedium?.fontWeight
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.025,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.22,
                      height: MediaQuery.of(context).size.height*0.05,
                      decoration: BoxDecoration(
                        color: Theme.of(context).shadowColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Text(
                          "1245 USDT",
                          style: TextStyle(
                              fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Cumulative Trading\nCommission",
                      style: TextStyle(
                          fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                          fontWeight: Theme.of(context).textTheme.bodyMedium?.fontWeight
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.025,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.22,
                      height: MediaQuery.of(context).size.height*0.05,
                      decoration: BoxDecoration(
                          color: Theme.of(context).shadowColor,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Text(
                          "432 USDT",
                          style: TextStyle(
                              fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Current Month\nReferral Income",
                      style: TextStyle(
                          fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                        fontWeight: Theme.of(context).textTheme.bodyMedium?.fontWeight
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.025,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.22,
                      height: MediaQuery.of(context).size.height*0.05,
                      decoration: BoxDecoration(
                          color: Theme.of(context).shadowColor,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Text(
                          "340 USDT",
                          style: TextStyle(
                              fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Current Month\nTrading Commission",
                      style: TextStyle(
                        fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                          fontWeight: Theme.of(context).textTheme.bodyMedium?.fontWeight
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.025,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.22,
                      height: MediaQuery.of(context).size.height*0.05,
                      decoration: BoxDecoration(
                          color: Theme.of(context).shadowColor,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Text(
                          "121 USDT",
                          style: TextStyle(
                            fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.06,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.02,
                    width: MediaQuery.of(context).size.width * 0.48,
                    color: Colors.transparent,
                    child: Text(
                      "Earnings Withdrawn: 736187455",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.02),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.02,
                    width: MediaQuery.of(context).size.width * 0.48,
                    color: Colors.transparent,
                    child: Text(
                      "Balance Available: 27189473833",
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.025,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {

                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.03,
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                      color: Theme.of(context).shadowColor,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text(
                        "Withdraw",
                        style: TextStyle(
                          fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
          ],
        ),
      ),
    );
  }
}
