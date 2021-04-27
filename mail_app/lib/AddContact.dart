import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'contactList.dart';
import 'contact.dart';

class AddContact extends StatefulWidget {
  _AddContact createState() => _AddContact();
}

class _AddContact extends State<AddContact> {
  String name;
  String mail;
  String phone;
  File _image;
  Future getImage() async {
    final image = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MaterialButton(
              onPressed: getImage,
              child: Container(
                margin: EdgeInsets.only(top: 50),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(image:_image==null?
                      NetworkImage('https://e7.pngegg.com/pngimages/712/154/png-clipart-index-finger-computer-icons-pointing-hand-hand-face-text.png'):
                      FileImage(_image)) ,
                ),
                // child: Center(
                //   child: _image == null
                //       ? Text('Select image')
                //       : CircleAvatar(
                //           child: Image.file(_image),
                //           radius: 200,
                //         ),
                // ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Row(
                children: [
                  Text(
                    "Name",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 14),
                    width: 290,
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onChanged: (input) {
                        name = input;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Row(
                children: [
                  Text(
                    "Mail",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 27),
                    width: 290,
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onChanged: (input) {
                        mail = input;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Row(
                children: [
                  Text(
                    "Phone",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    width: 290,
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onChanged: (input) {
                        phone = input;
                      },
                    ),
                  ),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {
                if(_image!=null) {
                  Contacts.contacts.add(
                    Contact(
                      name: name,
                      mail: mail,
                      phone: phone,
                      image: _image,
                      url: 'null',
                    ),
                  );
                }
                else{
                  Contacts.contacts.add(
                    Contact(
                      name: name,
                      mail: mail,
                      phone: phone,
                      url: 'https://e7.pngegg.com/pngimages/712/154/png-clipart-index-finger-computer-icons-pointing-hand-hand-face-text.png',
                    ),
                  );
                }
              },
              child: Container(
                margin: EdgeInsets.only(top: 50),
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Center(
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
