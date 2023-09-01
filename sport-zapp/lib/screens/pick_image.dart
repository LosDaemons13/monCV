import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

class pick_image extends StatefulWidget {
  pick_image({Key? key, required String this.id, this.setFile})
      : super(key: key);
  String id;
  final setFile;
  @override
  State<pick_image> createState() => _pick_imageState();
}

class _pick_imageState extends State<pick_image> {
  File? file;
  XFile? image;
  Future<NetworkImage>? pfp;
  Widget? pfpWidget;
  @override
  Widget build(BuildContext context) {
    firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;
    pfp = getProfilePicture(storage, widget.id);
    return FutureBuilder<NetworkImage>(
        future: pfp,
        builder: (BuildContext context, AsyncSnapshot<NetworkImage> snapshot) {
          if (snapshot.hasData && file == null) {
            pfpWidget = CircleAvatar(backgroundImage: snapshot.data);
          } else {
            pfpWidget = CircleAvatar(
                backgroundImage: file == null ? null : FileImage(file!));
          }
          return Column(children: [
            GestureDetector(
                onTap: () {
                  XFile? oldImage = image;
                  final ImagePicker picker = ImagePicker();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        actions: <Widget>[
                          Row(
                            children: [
                              TextButton(
                                child:
                                    const Text('Choisir une photo existante'),
                                onPressed: () async {
                                  image = await picker.pickImage(
                                      source: ImageSource.gallery,
                                      maxHeight: 300,
                                      maxWidth: 300);

                                  await setProfilePicture(
                                    image,
                                    oldImage,
                                  );
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              TextButton(
                                child: const Text('Prendre une photo'),
                                onPressed: () async {
                                  image = await picker.pickImage(
                                      source: ImageSource.camera,
                                      maxHeight: 300,
                                      maxWidth: 300);
                                  await setProfilePicture(
                                    image,
                                    oldImage,
                                  );
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 25.0, right: 25),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 5, color: Color(0xFF5AE999)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(500)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 15,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                width: 150,
                                height: 150,
                                child: pfpWidget,
                              ),
                            ),
                            Positioned(
                              top: 115,
                              left: 110,
                              child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF5AE999),
                                    borderRadius: new BorderRadius.all(
                                        Radius.circular(500)),
                                  ),
                                  child: Icon(Icons.add)),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                )),
          ]);
        });
  }

  setProfilePicture(XFile? image, XFile? oldImage) async {
    if (image != null) {
      int size = await image.length();
      if (size < 2000000) {
        setState(() {
          file = File(image!.path);
          pfpWidget = CircleAvatar(
              backgroundImage: file == null ? null : FileImage(file!));
        });
        widget.setFile(file);
      }
    } else {
      print("nulllllll");
      image = oldImage;
    }
  }
}

Future<NetworkImage> getProfilePicture(
    firebase_storage.FirebaseStorage storage, String uid) async {
  String downloadURL;
  try {
    downloadURL = await storage.ref('TestPFP/${uid}.png').getDownloadURL();
  } on FirebaseException catch (e) {
    downloadURL = await storage.ref('TestPFP/testPfp.jpg').getDownloadURL();
  }
  await downloadURL;
  NetworkImage pfp = NetworkImage(downloadURL);
  return pfp;
}

Future<String> getPfpPath(
    firebase_storage.FirebaseStorage storage, String uid) async {
  String downloadURL;
  try {
    downloadURL = await storage.ref('TestPFP/${uid}.png').getDownloadURL();
  } on FirebaseException catch (e) {
    downloadURL = await storage.ref('TestPFP/testPfp.jpg').getDownloadURL();
  }
  return downloadURL;
}
