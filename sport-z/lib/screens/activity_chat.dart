import 'package:projet_sport_z/screens/category/homepage.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash/flash.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:projet_sport_z/widgets/user/profile_picture.dart';

import '../utils/load_user_infos.dart';
import '../widgets/menu.dart';

class Activity_Chat extends StatefulWidget {
  Activity_Chat({Key? key, required this.chatInfos}) : super(key: key);
  Map chatInfos;

  @override
  State<Activity_Chat> createState() => _Activity_ChatState();
}

class _Activity_ChatState extends State<Activity_Chat> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  String? msg;

  bool darkmode = false;
  dynamic savedThemeMode;
  Color? colorTheme;
  Color? backgroundColor;
  Map userInfos = {};

  @override
  void initState() {
    super.initState();
    getTheme();
    populateUserInfos();
  }

  populateUserInfos() async {
    Map map = await readUserInfos();
    setState(() {
      userInfos = map;
    });
  }

  Future getTheme() async {
    var savedThemeMode = await AdaptiveTheme.getThemeMode();
    if (savedThemeMode.toString() == 'AdaptiveThemeMode.dark') {
      setState(() {
        darkmode = true;
        colorTheme = const Color(0xFFFAFAFA);
        backgroundColor = const Color(0xFF403030);
      });
    } else {
      setState(() {
        darkmode = false;
        colorTheme = const Color(0xFF101020);
        backgroundColor = const Color(0xFFFAFAFA);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController newMessage = TextEditingController();
    ScrollController scrollControl = ScrollController();
    final Stream<QuerySnapshot> messages = FirebaseFirestore.instance
        .collection(widget.chatInfos["id"])
        .orderBy("sendingTime")
        .snapshots();
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(widget.chatInfos["title"],
              style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(16, 16, 16, 1))),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        drawer: const Menu(),
        body: Theme(
          data: ThemeData(
            textTheme: GoogleFonts.outfitTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollControl,
                  child: Column(
                    children: [
                      StickyHeader(
                        header: Container(
                          color: const Color(0xffFAFAFA),
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      const WidgetSpan(
                                        child: Icon(Icons.close, size: 14),
                                      ),
                                      TextSpan(
                                          text: "Fermer",
                                          style: const TextStyle(
                                            color:
                                                Color.fromRGBO(16, 16, 16, 1),
                                            fontSize: 14.0,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Home()))),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                        content: StreamBuilder<QuerySnapshot>(
                            stream: messages,
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasError) {
                                return const Text("Une erreur est survenue");
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Column(
                                  children: const [
                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          width: 60,
                                          height: 60,
                                          child: CircularProgressIndicator(
                                            backgroundColor: Color(0XFFB4B4B4),
                                            color: Color(0XFF5AE999),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 16),
                                      child: Text('Chargement...'),
                                    ),
                                  ],
                                );
                              }
                              final data = snapshot.requireData;
                              return ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: data.size,
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    if (data.docs[index].id == "firstMsg") {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Le ${DateFormat('dd/MM/yyyy').format(data.docs[index]["sendingTime"].toDate())}",
                                            style: const TextStyle(
                                                color: Color(0xFFB4B4B4)),
                                          ),
                                        ],
                                      );
                                    } else {
                                      return Container(
                                          padding: const EdgeInsets.only(
                                              left: 14,
                                              right: 14,
                                              top: 10,
                                              bottom: 10),
                                          child: Align(
                                              alignment: (data.docs[index]
                                                          ["idFrom"] ==
                                                      FirebaseAuth.instance
                                                          .currentUser!.uid
                                                  ? Alignment.topRight
                                                  : Alignment.topLeft),
                                              child: Container(
                                                child: Wrap(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: (data
                                                                          .docs[
                                                                      index]
                                                                  ["idFrom"] ==
                                                              FirebaseAuth
                                                                  .instance
                                                                  .currentUser!
                                                                  .uid
                                                          ? MainAxisAlignment
                                                              .end
                                                          : MainAxisAlignment
                                                              .start),
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        data.docs[index][
                                                                    "idFrom"] !=
                                                                FirebaseAuth
                                                                    .instance
                                                                    .currentUser!
                                                                    .uid
                                                            ? Profile_Picture(
                                                                uid: data.docs[
                                                                        index]
                                                                    ["idFrom"],
                                                                radius: 15)
                                                            : const SizedBox(),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Flexible(
                                                          child: Column(
                                                            crossAxisAlignment: (data.docs[
                                                                            index]
                                                                        [
                                                                        "idFrom"] ==
                                                                    FirebaseAuth
                                                                        .instance
                                                                        .currentUser!
                                                                        .uid
                                                                ? CrossAxisAlignment
                                                                    .end
                                                                : CrossAxisAlignment
                                                                    .start),
                                                            children: [
                                                              Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius: data.docs[index]["idFrom"] ==
                                                                            FirebaseAuth
                                                                                .instance.currentUser!.uid
                                                                        ? const BorderRadius.only(
                                                                            topLeft: Radius.circular(
                                                                                15),
                                                                            topRight: Radius.circular(
                                                                                15),
                                                                            bottomLeft: Radius.circular(
                                                                                15),
                                                                            bottomRight: Radius.circular(
                                                                                5))
                                                                        : const BorderRadius.only(
                                                                            topLeft:
                                                                                Radius.circular(15),
                                                                            topRight: Radius.circular(15),
                                                                            bottomLeft: Radius.circular(5),
                                                                            bottomRight: Radius.circular(15)),
                                                                    color: data.docs[index]["idFrom"] ==
                                                                            FirebaseAuth
                                                                                .instance.currentUser!.uid
                                                                        ? const Color(
                                                                            0xff5AE999)
                                                                        : const Color(
                                                                            0xffF1F1F1),
                                                                  ),
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .fromLTRB(
                                                                          15,
                                                                          10,
                                                                          15,
                                                                          10),
                                                                  child: Column(
                                                                    crossAxisAlignment: (data.docs[index]["idFrom"] ==
                                                                            FirebaseAuth
                                                                                .instance.currentUser!.uid
                                                                        ? CrossAxisAlignment
                                                                            .end
                                                                        : CrossAxisAlignment
                                                                            .start),
                                                                    children: [
                                                                      data.docs[index]["idFrom"] !=
                                                                              FirebaseAuth.instance.currentUser!.uid
                                                                          ? Text(
                                                                              data.docs[index]["pseudoFrom"],
                                                                              textAlign: data.docs[index]["idFrom"] == FirebaseAuth.instance.currentUser!.uid ? TextAlign.right : TextAlign.left,
                                                                              style: const TextStyle(color: Color(0xff5AE999)),
                                                                            )
                                                                          : const SizedBox(),
                                                                      const SizedBox(
                                                                        height:
                                                                            5,
                                                                      ),
                                                                      Text(
                                                                        "${data.docs[index]["msg"]}",
                                                                        textAlign: data.docs[index]["idFrom"] ==
                                                                                FirebaseAuth.instance.currentUser!.uid
                                                                            ? TextAlign.right
                                                                            : TextAlign.left,
                                                                        style: const TextStyle(
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                    ],
                                                                  )),
                                                              const SizedBox(
                                                                height: 3,
                                                              ),
                                                              Text(
                                                                DateFormat(
                                                                        'dd/MM - ')
                                                                    .add_Hm()
                                                                    .format(data
                                                                        .docs[
                                                                            index]
                                                                            [
                                                                            "sendingTime"]
                                                                        .toDate()),
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        10),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        data.docs[index][
                                                                    "idFrom"] ==
                                                                FirebaseAuth
                                                                    .instance
                                                                    .currentUser!
                                                                    .uid
                                                            ? Profile_Picture(
                                                                uid: data.docs[
                                                                        index]
                                                                    ["idFrom"],
                                                                radius: 15)
                                                            : const SizedBox(),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              )));
                                    }
                                  });
                            }),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            width: 1.0, color: Colors.black.withOpacity(0.1)))),
                child: Stack(children: [
                  Container(
                    margin: const EdgeInsets.all(12),
                    padding: const EdgeInsets.fromLTRB(22, 12, 12, 12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xffF1F1F1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            minLines: 1,
                            maxLines: 5,
                            controller: newMessage,
                            decoration: const InputDecoration(
                                hintText: "Écrire un message...",
                                hintStyle:
                                    const TextStyle(color: Colors.black54),
                                border: InputBorder.none),
                          ),
                        ),
                        SizedBox(
                          width: 33,
                          height: 33,
                          child: FloatingActionButton(
                            onPressed: () {
                              if (newMessage.text.length < 160 &&
                                  newMessage.text.isNotEmpty) {
                                final uploadMsg = <String, dynamic>{
                                  "msg": newMessage.text,
                                  "idFrom":
                                      FirebaseAuth.instance.currentUser!.uid,
                                  "sendingTime": DateTime.now(),
                                  "pseudoFrom": userInfos["pseudo"]
                                };
                                FirebaseFirestore.instance
                                    .collection(widget.chatInfos["id"])
                                    .add(uploadMsg)
                                    .then((value) => print(value.id));
                                newMessage.clear();
                              } else {
                                showFlash(
                                    context: context,
                                    duration: const Duration(seconds: 4),
                                    builder: (context, controller) {
                                      return Flash.bar(
                                        controller: controller,
                                        position: FlashPosition.top,
                                        backgroundColor:
                                            const Color(0xFFf8d7da),
                                        child: FlashBar(
                                          content: Text(
                                              'Votre message ne peut pas dépasser les 160 caractères ! Vous en avez rentré ${newMessage.text.length}',
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: Color(0xFF721c24),
                                                  fontSize: 18)),
                                        ),
                                      );
                                    });
                              }
                            },
                            child: const Icon(
                              Icons.send,
                              color: Colors.black,
                              size: 18,
                            ),
                            backgroundColor: const Color(0xff5AE999),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              )
            ],
          ),
        ));
  }
}
