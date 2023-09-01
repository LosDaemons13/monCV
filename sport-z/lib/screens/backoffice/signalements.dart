import 'package:flutter/material.dart';

class Signalements extends StatelessWidget {
  const Signalements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'Signalements activités',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFFFAFAFA),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Expanded(
            child: DataTable(
              headingRowColor: MaterialStateColor.resolveWith(
                  (states) => const Color.fromARGB(255, 231, 231, 231)),
              columns: const <DataColumn>[
                DataColumn(
                  label: Text(
                    'id',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'titre',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Actions',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    const DataCell(Text(
                      '246',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    )),
                    const DataCell(Text(
                      'Pellentesque rhoncus dignissim varius',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    )),
                    DataCell(
                      IconButton(
                        icon: const Icon(
                          Icons.delete_rounded,
                          color: Colors.red,
                        ),
                        tooltip: "delete user",
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    const DataCell(Text(
                      '289',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    )),
                    const DataCell(Text(
                      'Sed ultrices lobortis consequat',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    )),
                    DataCell(
                      IconButton(
                        icon: const Icon(
                          Icons.delete_rounded,
                          color: Colors.red,
                        ),
                        tooltip: "delete user",
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    const DataCell(Text(
                      '307',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    )),
                    const DataCell(Text(
                      'Morbi id metus a lacus sodales luctus',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    )),
                    DataCell(
                      IconButton(
                        icon: const Icon(
                          Icons.delete_rounded,
                          color: Colors.red,
                        ),
                        tooltip: "delete user",
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
