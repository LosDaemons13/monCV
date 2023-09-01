import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:projet_sport_z/configs/connection_bdd.dart';
import 'package:projet_sport_z/screens/pick_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Map> loadUserInfos() async {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  Map infos = await getUserInfos(uid);
  final storage = FirebaseStorage.instance;
  infos["pfpPath"] = await getPfpPath(storage, uid);
  infos.removeWhere((key, value) => key == "birthDate");
  infos["description"] = infos["description"].toString();
  return infos;
}

loadUserProInfos() async {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  Map infos = await fetchUserProInfos(uid);
  final storage = FirebaseStorage.instance;
  infos["pfpPath"] = await getPfpPath(storage, uid);
  infos.removeWhere((key, value) => key == "birthDate");
  infos["description"] = infos["description"].toString();
  return infos;
}

setUserInfos(String type) async {
  Map map = {};
  if (type == "user") {
    map = await loadUserInfos();
  } else if (type == "pro") {
    map = await loadUserProInfos();
  }
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('userInfo', jsonEncode(map));
}

readUserInfos() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Map map = jsonDecode(prefs.getString('userInfo')!);
  return map;
}

deleteUserInfos() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Map map = jsonDecode(prefs.getString('userInfo')!);
  return map;
}
