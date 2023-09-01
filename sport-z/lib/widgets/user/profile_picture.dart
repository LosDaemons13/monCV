import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Profile_Picture extends StatefulWidget {
  Profile_Picture({Key? key, required this.uid, required this.radius}) : super(key: key);
  double radius;
  String uid;

  @override
  State<Profile_Picture> createState() => Profile_PictureState();
}

class Profile_PictureState extends State<Profile_Picture> {
  ImageProvider pfp = const AssetImage('assets/images/defaultPfp.jpg');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setPfp();
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: widget.radius,
      backgroundColor: Color(0xFFFAFAFA),
      backgroundImage: pfp,
    );
  }

  setPfp() async {
    ImageProvider tempPfp = await getProfilePicture(
        firebase_storage.FirebaseStorage.instance, widget.uid);
    setState(() {
      pfp = tempPfp;
    });
  }
}

Future<ImageProvider> getProfilePicture(
    firebase_storage.FirebaseStorage storage, String uid) async {
  String downloadURL;
  try {
    downloadURL = await storage.ref('TestPFP/${uid}.png').getDownloadURL();
    NetworkImage pfp = NetworkImage(downloadURL);
    return pfp;
  } on FirebaseException catch (e) {
    return const AssetImage('assets/images/defaultPfp.jpg');
  }
}
