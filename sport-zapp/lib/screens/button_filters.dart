// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/activities/filters.dart';

class ButtonFilters extends StatefulWidget {
  const ButtonFilters({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ButtonFiltersState();
  }
}

class ButtonFiltersState extends State<ButtonFilters> {
  Map filters = {};
  updateFilters(Map newFilters) {
    setState(() {
      filters = newFilters;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
          title: const Text('Test',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(16, 16, 16, 1))),
          centerTitle: true,
          actions: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: CircleAvatar(
                backgroundColor: const Color.fromRGBO(90, 233, 153, 1),
                child: IconButton(
                  icon: SvgPicture.asset('assets/images/icons/filters.svg'),
                  tooltip: "Save Todo and Retrun to List",
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Filters()));
                  },
                ),
              ),
            )
          ],
        ),
        body: const SingleChildScrollView());
  }
}
