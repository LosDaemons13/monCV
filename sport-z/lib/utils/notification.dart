import 'package:flutter/material.dart';

class Notif extends StatelessWidget {
  const Notif({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          print("Tapped on container");
        },
        child: Container(
          padding: const EdgeInsets.all(15.0),
          decoration: const BoxDecoration(
              border: Border(
            bottom: BorderSide(
              color: Color(0xFFE7E7E7),
              width: 1.0,
            ),
          )),
          child: Row(
            children: [
              // color: Colors.blue,
              Stack(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/avatar.jpg'),
                    radius: 30,
                  ),
                  Positioned(
                      left: 0.0,
                      top: 3.0,
                      child: Container(
                        width: 15.0,
                        height: 15.0,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xFF5AE999)),
                      )),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Mathieu13011',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text('11h25', style: TextStyle(color: Colors.grey))
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                    child:
                        const Text('lorem ispum dolor sit amet consecur lorem'),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
