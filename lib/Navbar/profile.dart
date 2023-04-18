import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copytrade_ui/lists.dart';
import 'package:copytrade_ui/main.dart';
import 'package:copytrade_ui/profile/change%20password.dart';
import 'package:flutter/material.dart';

import '../profile/edit profile.dart';
import '../profile/help center.dart';
import '../profile/settings.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

getUser() async {
  DocumentSnapshot<Map<String, dynamic>> doc1 = await FirebaseFirestore.instance
      .collection("users")
      .doc(currentUserId)
      .get();
  currentUserData = doc1.data()!;
  currentUserName = doc1.get("display_name");
  print(currentUserName);
}

class _ProfileState extends State<Profile> {

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: darkMode ? true : false,
      backgroundColor: darkMode ? Colors.transparent : Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: darkMode ? Colors.transparent : Theme.of(context).scaffoldBackgroundColor,
        elevation: Theme.of(context).appBarTheme.elevation,
        automaticallyImplyLeading: false,
        toolbarHeight: MediaQuery.of(context).size.height*0.03,
      ),
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
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.06,
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection("users").snapshots(),
              builder: ((context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                print(currentUserName);
                print(currentUserId);
                return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.055),
                                  child: Text(
                                    "Hello, "+currentUserName.toString(),
                                    style:TextStyle(
                                        color: Theme.of(context).textTheme.titleMedium?.color,
                                      fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height*0.02,
                            ),
                            RawMaterialButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()));
                              },
                              focusElevation: 0,
                              highlightElevation: 0,
                              hoverElevation: 0,
                              elevation: 0,
                              constraints: BoxConstraints(
                                  minWidth: MediaQuery.of(context).size.width*0.95,
                                  minHeight: MediaQuery.of(context).size.height*0.09,
                                  maxWidth: MediaQuery.of(context).size.width*0.95
                              ),
                              fillColor: Colors.transparent,
                              child: ListTile(
                                leading: Text(
                                  "Edit Profile",
                                  style: TextStyle(
                                    fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                                    color: Theme.of(context).textTheme.titleSmall?.color,
                                  ),
                                ),
                                trailing: Icon(
                                    Icons.edit,
                                    color: Theme.of(context).iconTheme.color
                                ),
                              ),
                            ),
                            Divider(
                              indent: MediaQuery.of(context).size.width*0.07,
                              endIndent: MediaQuery.of(context).size.width*0.07,
                              color: Theme.of(context).highlightColor,
                              thickness: 1,
                            ),
                            RawMaterialButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePwd()));
                              },
                              focusElevation: 0,
                              highlightElevation: 0,
                              hoverElevation: 0,
                              elevation: 0,
                              constraints: BoxConstraints(
                                  minWidth: MediaQuery.of(context).size.width*0.95,
                                  minHeight: MediaQuery.of(context).size.height*0.09,
                                  maxWidth: MediaQuery.of(context).size.width*0.95
                              ),
                              fillColor: Colors.transparent,
                              child: ListTile(
                                leading: Text(
                                  "Change Password",
                                  style: TextStyle(
                                    fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                                    color: Theme.of(context).textTheme.titleSmall?.color,
                                  ),
                                ),
                                trailing: Icon(
                                    Icons.lock_sharp,
                                    color: Theme.of(context).iconTheme.color
                                ),
                              ),
                            ),
                            Divider(
                              indent: MediaQuery.of(context).size.width*0.07,
                              endIndent: MediaQuery.of(context).size.width*0.07,
                              color: Theme.of(context).highlightColor,
                              thickness: 1,
                            ),
                            RawMaterialButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>HelpCenter()));
                              },
                              focusElevation: 0,
                              highlightElevation: 0,
                              hoverElevation: 0,
                              elevation: 0,
                              constraints: BoxConstraints(
                                  minWidth: MediaQuery.of(context).size.width*0.95,
                                  minHeight: MediaQuery.of(context).size.height*0.09,
                                  maxWidth: MediaQuery.of(context).size.width*0.95
                              ),
                              fillColor: Colors.transparent,
                              child: ListTile(
                                leading: Text(
                                  "Help Center",
                                  style: TextStyle(
                                    fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                                    color: Theme.of(context).textTheme.titleSmall?.color,
                                  ),
                                ),
                                trailing: Icon(
                                    Icons.help,
                                    color: Theme.of(context).iconTheme.color
                                ),
                              ),
                            ),
                            Divider(
                              indent: MediaQuery.of(context).size.width*0.07,
                              endIndent: MediaQuery.of(context).size.width*0.07,
                              color: Theme.of(context).highlightColor,
                              thickness: 1,
                            ),
                            RawMaterialButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings1()));
                              },
                              focusElevation: 0,
                              highlightElevation: 0,
                              hoverElevation: 0,
                              elevation: 0,
                              constraints: BoxConstraints(
                                  minWidth: MediaQuery.of(context).size.width*0.95,
                                  minHeight: MediaQuery.of(context).size.height*0.09,
                                  maxWidth: MediaQuery.of(context).size.width*0.95
                              ),
                              fillColor: Colors.transparent,
                              child: ListTile(
                                leading: Text(
                                  "Settings",
                                  style: TextStyle(
                                    fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                                    color: Theme.of(context).textTheme.titleSmall?.color,
                                  ),
                                ),
                                trailing: Icon(
                                    Icons.settings_sharp,
                                    color: Theme.of(context).iconTheme.color
                                ),
                              ),
                            ),
                            Divider(
                              indent: MediaQuery.of(context).size.width*0.07,
                              endIndent: MediaQuery.of(context).size.width*0.07,
                              color: Theme.of(context).highlightColor,
                              thickness: 1,
                            ),
                          ],
                        );
              }),
            ),
          ],
        ),
      ) :
      Column(
        children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection("users").snapshots(),
            builder: ((context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              print(currentUserName);
              print(currentUserId);
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.055),
                        child: Text(
                          currentUserName.toString(),
                          style:TextStyle(
                              color: Theme.of(context).textTheme.titleMedium?.color,
                              fontSize: Theme.of(context).textTheme.titleMedium?.fontSize
                          ),
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
                        itemCount: editProfile.length,
                        itemBuilder: (context,index){
                          return Column(
                            children: [
                              RawMaterialButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>editProfile[index]["Navigation"]));
                                },
                                focusElevation: 0,
                                highlightElevation: 0,
                                hoverElevation: 0,
                                elevation: 0,
                                constraints: BoxConstraints(
                                    minWidth: MediaQuery.of(context).size.width*0.95,
                                    minHeight: MediaQuery.of(context).size.height*0.09,
                                    maxWidth: MediaQuery.of(context).size.width*0.95
                                ),
                                fillColor: Theme.of(context).scaffoldBackgroundColor,
                                child: ListTile(
                                  leading: Text(
                                    editProfile[index]["Name"],
                                    style: TextStyle(
                                      fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                                      color: Theme.of(context).textTheme.titleSmall?.color,
                                    ),
                                  ),
                                  trailing: Icon(
                                      editProfile[index]["Icon"],
                                      color: Theme.of(context).iconTheme.color
                                  ),
                                ),
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
              );
            }),
          ),
        ],
      ),
    );
  }
}
