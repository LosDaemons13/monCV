// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookApp extends StatefulWidget {
  const FacebookApp({ Key? key }) : super(key: key);

  @override
  _FacebookAppState createState() => _FacebookAppState();
}

class _FacebookAppState extends State<FacebookApp> {
  Map? _userData;
  Widget ShowImage(String url) {
    if(url != "") {
        return Image.network(url);
    }
    else {
        return const Text('no data');
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Facebook ' + (_userData == null ? "déconnecté" : "connecté")),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: (() {
                  
                }), 
                child: const Text('Connexion')
              ),
              ElevatedButton(
                onPressed: () async{
                  await FacebookAuth.i.logOut();
                  setState(() {
                    _userData = null;
                  });
                }, 
              child: const Text('Déconnexion'),
              ),
              ShowImage(_userData == null ? "" : _userData!["picture"]["data"]["url"]),
            ],
          ),
        ),
      ),
    );
  }
}