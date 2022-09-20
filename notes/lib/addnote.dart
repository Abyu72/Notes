import 'package:flutter/material.dart';
import 'package:localdata/sqldb.dart';

import 'home1.dart';

class addnote extends StatefulWidget {
  addnote({Key? key}) : super(key: key);

  @override
  State<addnote> createState() => _addnoteState();
}

class _addnoteState extends State<addnote> {
  SqlDb sqlDb = SqlDb();
  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController title = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController color = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add note"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            Form(
                key: formState,
                child: Column(
                  children: [
                    TextFormField(
                      controller: note,
                      decoration: InputDecoration(hintText: "title"),
                    ),
                    TextFormField(
                      controller: title,
                      decoration: InputDecoration(hintText: "note"),
                    ),
                    /*TextFormField(
                      controller: color,
                      decoration: InputDecoration(hintText: "time"),
                    ),*/
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 40,
                        width: 150,
                        margin: EdgeInsets.all(20),
                        child: RaisedButton(
                          color: Colors.white,
                          onPressed: () async {
                            int response = await sqlDb.insertData('''
                            INSERT INTO notes (note,title,color)
                            VALUES ("${note.text}","${title.text}","${color.text}")

                                    ''');
                            if (response > 0) {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => home1()),
                                  (route) => false);
                            }
                          },
                          child: Text("add note",style: TextStyle(fontSize: 20,color: Colors.orange),),
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
