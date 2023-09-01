import 'package:flutter/material.dart';

import '../../configs/connection_bdd.dart';

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);
  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  final Future<Map> activities = selectAllUsers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'Gestion des utilisateurs',
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
                    'Pseudo',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'email',
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
                      'William',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    )),
                    const DataCell(Text(
                      'william@gmail.com',
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
