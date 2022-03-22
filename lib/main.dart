import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';


void main() {
  runApp(const MyApp());
}
const String facebook ='https://www.facebook.com/Hasni.Zoumata.0103/';
const String instagram ='https://www.instagram.com/hasni_zoumata/?hl=fr';
const String linkedin ='https://www.linkedin.com/in/hasni-zoumata-855a661b7/';
const String snapchat = 'https://www.snapchat.com/add/hasni.zoumata?share_id=REE4REJG&locale=fr_DZ';
const String mail = 'https://accounts.google.com/b/0/AddMailService';
const String github ='https://github.com/hasnizmt13';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInApp(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: false,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchUniversalLinkIos(String url) async {
    if (await canLaunch(url)) {
      final bool nativeAppLaunchSucceeded = await launch(
        url,
        forceSafariVC: false,
        universalLinksOnly: true,
      );
      if (!nativeAppLaunchSucceeded) {
        await launch(url, forceSafariVC: true);
      }
    }
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/hasni.jpg'),
              ),
              const Text(
                'Hasni Zoumata',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Pacifico',
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const Text(
                'COMPUTER SCIENCE STUDENT',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              Container(
                height: 8,
              ),
              Container(
                width: 210,
                height: 1,
                color: Colors.teal,
              ),
              Container(
                margin:
                    const EdgeInsets.only(top: 30, right:40,left: 40,bottom: 10),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children:  <Widget>[
                    IconButton(
                      icon: const Icon(
                        Icons.phone,
                        color: Colors.white,
                        size: 25,
                      ), onPressed: () { _makePhoneCall('tel:0552833250'); },
                    ),
                    const SizedBox(width: 60),
                    const Text(
                      '+213 0552833250',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 40, top: 1, right: 40, bottom: 30),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children:  <Widget>[
                    IconButton(
                      icon: const Icon(
                        Icons.mail,
                        color: Colors.white,
                      ), onPressed: () { _launchInApp(mail); },
                    ),
                    const SizedBox(width: 60),
                    const Text(
                      'jh_zoumata@esi.dz',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:  <Widget>[
                   FloatingActionButton(
                    onPressed:(){
                      _launchInApp(facebook);
                    },
                    backgroundColor: Colors.white,
                    child: const CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('images/facebook.png'),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed:(){
                      _launchInApp(snapchat);
                    },
                    backgroundColor: Colors.white,
                    child: const CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('images/snapchat.png'),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed:(){
                      _launchInApp(linkedin);
                    },
                    backgroundColor: Colors.white,
                    child: const CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('images/linkedin.png'),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed:(){
                      _launchInApp(instagram);
                    },
                    backgroundColor: Colors.white,
                    child: const CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('images/instagram.png'),
                    ),
                  ),
                ],
              ),
              Container(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const <Widget>[
                  Text(
                    'Facebook',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Roboto',
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Snapchat',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Roboto',
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Linkedin',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Roboto',
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Instagram',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Roboto',
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              FloatingActionButton(
                onPressed:(){
                  _launchInApp(github);
                },
                backgroundColor: Colors.white,
                child: const CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('images/github.png'),
                ),
              ),
              const Text(
              'Gihub',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top:20,bottom:1),
                width : 210,
                height : 1,
                color: Colors.teal,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(Icons.copyright , color: Colors.teal,),
                  Text(
                    ' 2021 Hasni Zoumata ',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Roboto',
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),

    );
  }
}
