import 'package:flutter/material.dart';
import 'package:projet_sport_z/configs/connection_bdd.dart';
import 'package:firebase_auth/firebase_auth.dart';


import '../opening.dart';

class FormDelete extends StatefulWidget {
  const FormDelete({Key? key}) : super(key: key);

  @override
  State<FormDelete> createState() => _FormDeleteState();
}

class _FormDeleteState extends State<FormDelete> {
  final checkBoxList = [
    CheckBoxModal(title: "Je n'utilise plus l'application"),
    CheckBoxModal(title: "J'ai trouvé une autre application similaire"),
    CheckBoxModal(title: "Je ne l'a trouve pas utile"),
    CheckBoxModal(title: "Elle est trop compliquée"),
    CheckBoxModal(title: "Sans raisons particulières"),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const Text('Pourquoi vous nous quittez ?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            const Divider(),
            ...checkBoxList
                .map(
                  (item) => ListTile(
                    onTap: () => onAllClicked(item),
                    leading: Checkbox(
                        value: item.value,
                        onChanged: (value) => onAllClicked(item)),
                    title: Text(
                      item.title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                )
                .toList(),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                onPressed: () async {
                  var result = await deleteUser(
                                                  FirebaseAuth.instance
                                                      .currentUser!.uid);
                                              if (result) {
                                                Navigator.pop(context);
                                              } else {
                                                print(
                                                    "erreur lors de la suppression");
                                              }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Authentication()));
                },
                child: const Text(
                  'Confirmer',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF5AE999)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: const BorderSide(color: Color(0xFF5AE999))))),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  onAllClicked(CheckBoxModal ckbItem) {
    setState(() {
      ckbItem.value = !ckbItem.value;
    });
  }
}

class CheckBoxModal {
  String title;
  bool value;

  CheckBoxModal({required this.title, this.value = false});
}

/*class FormDelete extends StatefulWidget {
  const FormDelete({Key? key}) : super(key: key);

  @override
  State<FormDelete> createState() => _FormDeleteState();
}

class _FormDeleteState extends State<FormDelete> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio Button"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Radio(
                value: 1,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                },
              ),
              const SizedBox(
                width: 10.0,
              ),
              const Text("Radio 1"),
            ],
          ),
          Row(
            children: [
              Radio(
                value: 2,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                },
              ),
              const SizedBox(
                width: 10.0,
              ),
              const Text("Radio 2"),
            ],
          ),
          Row(
            children: [
              Radio(
                value: 3,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                },
              ),
              const SizedBox(
                width: 10.0,
              ),
              const Text("Radio 3"),
            ],
          ),
          Row(
            children: [
              Radio(
                value: 4,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                },
              ),
              const SizedBox(
                width: 10.0,
              ),
              const Text("Radio 4"),
            ],
          ),
        ],
      ),
    );
  }
}*/

/*class FormDelete extends StatefulWidget {
  const FormDelete({Key? key}) : super(key: key);

  @override
  State<FormDelete> createState() => _FormDeleteState();
}

class _FormDeleteState extends State<FormDelete> {
  int selectedRadio = 0;
  int val;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio Button"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: selectedRadio,
                activeColor: Color(0xFF5AE999),
                onChanged: (val) {
                  // ignore: avoid_print
                  print("Radio $val");
                  setSelectedRadio(val);
                },
              ),
              Radio(
                value: 2,
                groupValue: selectedRadio,
                activeColor: Color(0xFF5AE999),
                onChanged: (val) {
                  // ignore: avoid_print
                  print("Radio $val");
                  setSelectedRadio(val);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}*/

/*class Item {
  Item(this.title);
  String title;
  bool selected = false;
}

class FormDelete extends StatelessWidget {
  const FormDelete({Key? key}) : super(key: key);

  final dataList = <Item>[].obs;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}*/
