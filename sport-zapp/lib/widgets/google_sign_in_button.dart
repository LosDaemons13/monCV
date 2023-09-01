// ignore_for_file: must_be_immutable, type_init_formals

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projet_sport_z/utils/google_auth.dart';
import 'package:projet_sport_z/configs/connection_bdd.dart';



class GoogleSignInButton extends StatelessWidget {
  // function google sign in
  GoogleSignInButton({Key? key, required Map? this.userData}) : super(key: key);
  Map? userData;
  bool? isSigningIn;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      width: 60.0,
      height: 60.0,
      child: ElevatedButton(
        onPressed: () async {
          isSigningIn = true;
          User? user = await Google_Auth.signInWithGoogle(context: context);
          isSigningIn = false;
          if (user != null) {
            Map userData = {
              "email": user.email,
              "id": user.uid,
              "api": "google"
            };
            var extUser = externalUserAuth(userData);
            extUser.then((value) => {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => ConnectedScreen(
                  //             userData: userData,
                  //           )),
                  // )
                });
          }
        },
        child: SvgPicture.asset(
          'assets/images/icons/google.svg',
          allowDrawingOutsideViewBox: true,
        ),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0xFF0C2544)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: const BorderSide(color: Color(0xFF5AE999))))),
      ),
    );
  }
}
