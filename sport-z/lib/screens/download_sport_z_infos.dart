import 'package:flutter/material.dart';

class DownloadSportZInfos extends StatefulWidget {
  const DownloadSportZInfos({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DownloadSportZInfosState();
  }
}

class DownloadSportZInfosState extends State<DownloadSportZInfos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF0C2544),
        appBar: AppBar(
          leading: const BackButton(color: Color(0xFFB4B4B4)),
          backgroundColor: const Color(0xFF0C2544),
          elevation: 0,
        ),
        body: Theme(
          data: ThemeData(
            unselectedWidgetColor: const Color(0xFFFAFAFA),
            fontFamily: 'Outfit',
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 26.0),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in rhoncus urna, eget dapibus tellus. Nunc sagittis lacus tortor, ut venenatis mauris iaculis vel.',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFFAFAFA),
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ]),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Télécharger',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFF5AE999)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side:
                                  const BorderSide(color: Color(0xFF5AE999))))),
                ),
              ],
            ),
          ),
        ));
  }
}
