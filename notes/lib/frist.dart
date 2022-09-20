import 'package:flutter/material.dart';

class frist extends StatefulWidget {
  frist({Key? key}) : super(key: key);

  @override
  State<frist> createState() => _fristState();
}

class _fristState extends State<frist> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Container(
              width: 380,
              height: 380,
              margin: EdgeInsets.only(top: 60,right: 20,left: 20),
              child: Image.asset("assets/images/im1.jpg"),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.orange, width: 3)),
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  ),
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      side: BorderSide(
                          color: Colors.orange,
                          width: 2,
                          style: BorderStyle.solid)),
                  onPressed: () {
                    Navigator.of(context).pushNamed('home1');
                  },
                  icon: Icon(
                    Icons.note_alt,
                    color: Colors.black,
                  ),
                  label: Text(
                    "My Notes",
                    style: TextStyle(color: Colors.black),
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}
