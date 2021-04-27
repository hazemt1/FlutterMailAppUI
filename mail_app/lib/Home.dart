import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mail_app/AddContact.dart';
import 'contactList.dart';
import 'profile.dart';
import 'profileScreen.dart';

class Home extends StatefulWidget {
  @override
  _state createState() => _state();
}

class _state extends State<Home> {
  int navBarIndex = 0;
  bool vis=true;
  @override
  Widget build(BuildContext context) {
    List<Widget> bodyWidgets = [
      ListView.builder(
          itemCount: Contacts.contacts.length,
          itemBuilder: (context, i) {
            Contacts.contacts[i].mailVis = !vis;
            Contacts.contacts[i].phoneVis = vis;
            return Contacts.contacts[i].build(context);
          }),
      ListView.builder(
          itemCount: Contacts.contacts.length,
          itemBuilder: (context, i) {
            Contacts.contacts[i].phoneVis = vis;
            Contacts.contacts[i].mailVis = !vis;
            return Contacts.contacts[i].build(context);
          }),
      ProfileScreen(),
      AddContact()
    ];
    List<String> Titles=['Contacts','Mails','profile','Add Contact'];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: Text(
            Titles[navBarIndex],
            style: TextStyle(color: Colors.deepOrange),
          ),
        ),
        drawer: Drawer(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.black12))),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 32,
                      backgroundImage: NetworkImage(
                        Profile.photo,
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            Profile.name,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.mail,
                              color: Colors.black,
                              size: 20,
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  Profile.mail,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      navBarIndex=0;
                    });
                  },
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black12)),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.home),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            'Home',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      navBarIndex=3;
                    });
                  },
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black12)),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.add),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            'Add Contact',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: bodyWidgets[navBarIndex],
        bottomNavigationBar: Visibility(
          visible: navBarIndex>2? false: true,
          child: BottomNavigationBar(
            backgroundColor: Colors.amberAccent,
            selectedItemColor: Colors.deepOrange,
            onTap: (index) {
              setState(() {
                navBarIndex = index;
                if(index==0)
                  vis =true;
                else
                  vis =false;
              });
            },
            currentIndex: navBarIndex>2? 0: navBarIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.contacts),
                label: 'contacts',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.mail),
                label: 'mail',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
