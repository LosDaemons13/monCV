// ignore_for_file: must_be_immutable, type_init_formals

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../configs/connection_bdd.dart';

class FacebookSignInButton extends StatelessWidget {
  FacebookSignInButton({Key? key, required this.userData})
      : super(key: key);
  Map? userData;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      width: 60.0,
      height: 60.0,
      child: ElevatedButton(
        onPressed: () async {
          final result = await FacebookAuth.i
              .login(permissions: ["public_profile", "email"]);
          if (result.status == LoginStatus.success) {
            final userData = await FacebookAuth.i
                .getUserData(fields: "name, email, picture");
            userData["api"] = "facebook";
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
          'assets/images/icons/facebook.svg',
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
