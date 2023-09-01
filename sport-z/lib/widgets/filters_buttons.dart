// ignore_for_file: must_be_immutable, type_init_formals, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class FiltersButtons extends StatelessWidget {
  FiltersButtons({Key? key, required Map this.sports}) : super(key: key);
  Map sports;

  @override
  Widget build(BuildContext context) {
    var buttons;
    sports.entries.map((entry) {
      buttons = Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                offset: Offset(0.0, 3.0),
                blurRadius: 16,
              )
            ]),
        child: SizedBox(
          width: 64,
          height: 64,
          child: CircleAvatar(
            backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
            child: IconButton(
              onPressed: () {},
              icon:
                  Image.asset('assets/images/icons/filtres/${entry.value}.png'),
              iconSize: 40,
            ),
          ),
        ),
      );
      return sports;
    }).toList();

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [buttons]);
  }
}
