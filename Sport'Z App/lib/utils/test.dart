// ignore_for_file: camel_case_types
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projet_sport_z/utils/load_user_infos.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);
  @override
  _test createState() => _test();
}

class _test extends State<test> {
  bool darkmode = false;
  dynamic savedThemeMode;
  Color? colorTheme;
  Color? background;
  String uid = FirebaseAuth.instance.currentUser!.uid;
  Map infos = {};
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                readUserInfos();
              },
              child: Text("test set"))
        ],
      ),
    );
  }
}
