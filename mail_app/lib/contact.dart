import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class Contact extends StatelessWidget {
  String name, mail, phone, url;
  File image;
  bool mailVis = true;
  bool phoneVis = true;
  Contact({this.name, this.mail, this.phone, this.url,this.image});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 290,
      height: 110,
      padding: EdgeInsets.only(top: 15),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.white10,
          border: Border.all(width: 1, color: Colors.blue),
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 32,
              backgroundImage: url=='null'? FileImage(image):NetworkImage(url),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                Visibility(
                  child: Row(
                    children: [
                      Icon(
                        Icons.mail,
                        color: Colors.white,
                        size: 20,
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            mail,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          )),
                    ],
                  ),
                  visible: mailVis,
                ),
                Visibility(
                  visible: phoneVis,
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.phone,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          phone,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
