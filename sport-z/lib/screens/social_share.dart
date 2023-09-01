import 'package:flutter/material.dart';
import 'package:share/share.dart';

class SocialShare extends StatefulWidget {
  const SocialShare({Key? key}) : super(key: key);

  @override
  State<SocialShare> createState() => _SocialShareState();
}

class _SocialShareState extends State<SocialShare> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SocialShare MY APP"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: IconButton(
              icon: const Icon(Icons.more_horiz_outlined),
              onPressed: () {
                Share.share("Activité");
              },
            ),
          )
        ],
      ),
      body: const Center(
        child: Text("SocialShare Button Creat"),
      ),
    );
  }
}
