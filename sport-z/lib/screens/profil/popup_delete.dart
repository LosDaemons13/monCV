import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projet_sport_z/screens/profil/formdelete.dart';

class PopupDelete extends StatefulWidget {
  const PopupDelete({Key? key}) : super(key: key);

  @override
  State<PopupDelete> createState() => _PopupDeleteState();
}

class _PopupDeleteState extends State<PopupDelete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Supression du compte'),
                content: const Text(
                    'Êtes-vous sûr de vouloir supprimer votre compte ?'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FormDelete()));
                      },
                      child: const Text('Oui')),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Non')),
                ],
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 18,
              fontFamily: 'Outfit',
            ),
            primary: const Color(0xFFE8062F),
            onPrimary: const Color(0xFFFAFAFA),
            padding:
                const EdgeInsets.only(top: 8, bottom: 8, left: 15, right: 15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          icon: SvgPicture.asset(
            'assets/images/icons/profile/delete.svg',
            color: const Color(0xFFFFFFFF),
          ),
          label: const Text('Supprimer mon compte'),
        ),
      ),
    );
  }
}
