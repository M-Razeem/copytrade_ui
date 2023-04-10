import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copytrade_ui/lists.dart';
import 'package:copytrade_ui/main.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

getUser() async {
  DocumentSnapshot<Map<String, dynamic>> doc1 = await FirebaseFirestore.instance
      .collection("user")
      .doc(currentUserId)
      .get();
  currentUserData = doc1.data()!;
  currentUserName = doc1.get("username");
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
    print(currentUserName);
    print(currentUserId);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: darkMode ? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).scaffoldBackgroundColor,
        elevation: Theme.of(context).appBarTheme.elevation,
        automaticallyImplyLeading: false,
        toolbarHeight: MediaQuery.of(context).size.height*0.03,
      ),
      body: Column(
        children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection("user").snapshots(),
            builder: ((context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
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
                              Padding(
                                padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.055),
                                child: CircleAvatar(
                                  radius: 35,
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
