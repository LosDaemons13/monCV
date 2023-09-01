// ignore_for_file: avoid_print

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flash/flash.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projet_sport_z/widgets/activities/rating_bar_select.dart';
import 'package:projet_sport_z/screens/category/filters.dart';

class Filters extends StatefulWidget {
  const Filters({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FiltersState();
  }
}

class FiltersState extends State<Filters> {
  Map filters = {};
  bool darkmode = false;
  dynamic savedThemeMode;
  Color? colorTheme;
  Color? backgroundColor;

  @override
  void initState() {
    super.initState();
    getTheme();
  }

  Future getTheme() async {
    var savedThemeMode = await AdaptiveTheme.getThemeMode();
    if (savedThemeMode.toString() == 'AdaptiveThemeMode.dark') {
      setState(() {
        darkmode = true;
        colorTheme = const Color(0xFFFAFAFA);
        backgroundColor = const Color(0XFF101010);
      });
    } else {
      setState(() {
        darkmode = false;
        colorTheme = const Color(0XFF101010);
        backgroundColor = const Color(0xFFFAFAFA);
      });
    }
  }

  List<String> sports = [];
  Color footballIcon = const Color.fromRGBO(255, 255, 255, 1);
  double currentSliderValue = 30;
  int counter = 0;
  int? rating = null;

  void filterClicked(String sportsName) {
    if (sports.any((element) => element == sportsName)) {
      setState(() {
        counter--;
        sports.removeWhere((element) => element == sportsName);
      });
    } else {
      setState(() {
        counter++;
        sports.add(sportsName);
      });
    }
  }

  Color setColor(String sportsName) {
    if (sports.any((element) => element == sportsName)) {
      return const Color.fromRGBO(90, 233, 153, 1);
    } else {
      return const Color.fromRGBO(255, 255, 255, 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: backgroundColor,
          title: Text('Filtrer',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: colorTheme)),
          centerTitle: true,
          actions: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                            color: Color.fromRGBO(180, 180, 180, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Annuler',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Theme(
            data: ThemeData(
              unselectedWidgetColor: const Color(0xFFFAFAFA),
              textTheme: GoogleFonts.outfitTextTheme(
                Theme.of(context).textTheme,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Filtrer par activité',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: colorTheme,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              ' ($counter)',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(90, 233, 153, 1),
                                fontSize: 20,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 3),
                                blurRadius: 15.0,
                                color: Color.fromRGBO(0, 0, 0, 0.1)),
                          ],
                        ),
                        child: SizedBox(
                          width: 64,
                          height: 64,
                          child: CircleAvatar(
                            backgroundColor: setColor("football"),
                            child: IconButton(
                              onPressed: () {
                                filterClicked("football");
                              },
                              icon: Image.asset(
                                  'assets/images/icons/filtres/football.png'),
                              iconSize: 40,
                            ),
                          ),
                        ),
                      ),
                      Container(
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
                            backgroundColor: setColor("tennis"),
                            child: IconButton(
                              onPressed: () {
                                filterClicked("tennis");
                              },
                              icon: Image.asset(
                                  'assets/images/icons/filtres/tennis.png'),
                              iconSize: 40,
                            ),
                          ),
                        ),
                      ),
                      Container(
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
                            backgroundColor: setColor("golf"),
                            child: IconButton(
                              onPressed: () {
                                filterClicked("golf");
                              },
                              icon: Image.asset(
                                  'assets/images/icons/filtres/golf.png'),
                              iconSize: 40,
                            ),
                          ),
                        ),
                      ),
                      Container(
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
                            backgroundColor: setColor("rugby"),
                            child: IconButton(
                              onPressed: () {
                                filterClicked("rugby");
                              },
                              icon: Image.asset(
                                  'assets/images/icons/filtres/rugby.png'),
                              iconSize: 40,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
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
                            backgroundColor: setColor("basketball"),
                            child: IconButton(
                              onPressed: () {
                                filterClicked("basketball");
                              },
                              icon: Image.asset(
                                  'assets/images/icons/filtres/basketball.png'),
                              iconSize: 40,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 35),
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
                            backgroundColor: setColor("tennis de table"),
                            child: IconButton(
                              onPressed: () {
                                filterClicked("tennis de table");
                              },
                              icon: Image.asset(
                                  'assets/images/icons/filtres/tennis de table.png'),
                              iconSize: 40,
                            ),
                          ),
                        ),
                      ),
                      Container(
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
                            backgroundColor: setColor("musculation"),
                            child: IconButton(
                              onPressed: () {
                                filterClicked("musculation");
                              },
                              icon: Image.asset(
                                  'assets/images/icons/filtres/musculation.png'),
                              iconSize: 40,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
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
                            backgroundColor: setColor("volleyball"),
                            child: IconButton(
                              onPressed: () {
                                filterClicked("volleyball");
                              },
                              icon: Image.asset(
                                  'assets/images/icons/filtres/volleyball.png'),
                              iconSize: 40,
                            ),
                          ),
                        ),
                      ),
                      Container(
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
                            backgroundColor: setColor("plongée"),
                            child: IconButton(
                              onPressed: () {
                                filterClicked("plongée");
                              },
                              icon: Image.asset(
                                  'assets/images/icons/filtres/plongée.png'),
                              iconSize: 40,
                            ),
                          ),
                        ),
                      ),
                      Container(
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
                            backgroundColor: setColor("skateboard"),
                            child: IconButton(
                              onPressed: () {
                                filterClicked("skateboard");
                              },
                              icon: Image.asset(
                                  'assets/images/icons/filtres/skateboard.png'),
                              iconSize: 40,
                            ),
                          ),
                        ),
                      ),
                      Container(
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
                            backgroundColor: setColor("billard"),
                            child: IconButton(
                              onPressed: () {
                                filterClicked("billard");
                              },
                              icon: Image.asset(
                                  'assets/images/icons/filtres/billard.png'),
                              iconSize: 40,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
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
                            backgroundColor: setColor("randonnée"),
                            child: IconButton(
                              onPressed: () {
                                filterClicked("randonnée");
                              },
                              icon: Image.asset(
                                  'assets/images/icons/filtres/randonée.png'),
                              iconSize: 40,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 35),
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
                            backgroundColor: setColor("pêche"),
                            child: IconButton(
                              onPressed: () {
                                filterClicked("pêche");
                              },
                              icon: Image.asset(
                                  'assets/images/icons/filtres/pêche.png'),
                              iconSize: 40,
                            ),
                          ),
                        ),
                      ),
                      Container(
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
                            backgroundColor: setColor("ski"),
                            child: IconButton(
                              onPressed: () {
                                filterClicked("ski");
                              },
                              icon: Image.asset(
                                  'assets/images/icons/filtres/ski.png'),
                              iconSize: 40,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
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
                            backgroundColor: setColor("boxe"),
                            child: IconButton(
                              onPressed: () {
                                filterClicked("boxe");
                              },
                              icon: Image.asset(
                                  'assets/images/icons/filtres/boxe.png'),
                              iconSize: 40,
                            ),
                          ),
                        ),
                      ),
                      Container(
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
                            backgroundColor: setColor("surf"),
                            child: IconButton(
                              onPressed: () {
                                filterClicked("surf");
                              },
                              icon: Image.asset(
                                  'assets/images/icons/filtres/surf.png'),
                              iconSize: 40,
                            ),
                          ),
                        ),
                      ),
                      Container(
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
                            backgroundColor: setColor("vélo"),
                            child: IconButton(
                              onPressed: () {
                                filterClicked("vélo");
                              },
                              icon: Image.asset(
                                  'assets/images/icons/filtres/vélo.png'),
                              iconSize: 40,
                            ),
                          ),
                        ),
                      ),
                      Container(
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
                            backgroundColor: setColor("pétanque"),
                            child: IconButton(
                              onPressed: () {
                                filterClicked("pétanque");
                              },
                              icon: Image.asset(
                                  'assets/images/icons/filtres/pétanque.png'),
                              iconSize: 40,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
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
                            backgroundColor: setColor("jeux vidéos"),
                            child: IconButton(
                              onPressed: () {
                                filterClicked("jeux vidéos");
                              },
                              icon: Image.asset(
                                  'assets/images/icons/filtres/jeux vidéos.png'),
                              iconSize: 40,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 35),
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
                            backgroundColor: setColor("badminton"),
                            child: IconButton(
                              onPressed: () {
                                filterClicked("badminton");
                              },
                              icon: Image.asset(
                                  'assets/images/icons/filtres/badminton.png'),
                              iconSize: 40,
                            ),
                          ),
                        ),
                      ),
                      Container(
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
                            backgroundColor: setColor("padel"),
                            child: IconButton(
                              onPressed: () {
                                filterClicked("padel");
                              },
                              icon: Image.asset(
                                  'assets/images/icons/filtres/padel.png'),
                              iconSize: 40,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: [
                        Text(
                          'Niveau',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: colorTheme,
                            fontSize: 20,
                          ),
                        ),
                        const Expanded(
                          child: Text(''),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: [
                        RatingBarSelect(
                          updateRating: updateRating,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: SizedBox(
                      width: 320.0,
                      height: 55.0,
                      child: ElevatedButton(
                          child: const Text(
                            'Afficher les résultats',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 22,
                            ),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0xFF5AE999)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: const BorderSide(
                                          color: Color(0xFF5AE999))))),
                          onPressed: () {
                            if (sports.isNotEmpty || rating != null) {
                              filters["sports"] = sports;
                              filters["rating"] = rating;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FiltersResults(
                                            filters: filters,
                                          )));
                            } else {
                              showFlash(
                                  context: context,
                                  duration: const Duration(seconds: 4),
                                  builder: (context, controller) {
                                    return Flash.bar(
                                      controller: controller,
                                      position: FlashPosition.top,
                                      backgroundColor: const Color(0xFFf8d7da),
                                      child: FlashBar(
                                        content: const Text(
                                            'Veuillez sélectionner au moins un filtre !',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color(0xFF721c24),
                                                fontSize: 18)),
                                      ),
                                    );
                                  });
                            }
                          }),
                    ),
                  )
                ],
              ),
            )));
  }

  updateRating(value) {
    setState(() {
      rating = value;
    });
  }
}
