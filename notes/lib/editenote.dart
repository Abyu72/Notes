import 'package:flutter/material.dart';
import 'package:localdata/sqldb.dart';

import 'home1.dart';

class editnote extends StatefulWidget {
  var note;
  var title;
  var id;
  var color;
  editnote({Key? key, this.note, this.title, this.id, this.color})
      : super(key: key);

  @override
  State<editnote> createState() => _editnoteState();
}

class _editnoteState extends State<editnote> {
  SqlDb sqlDb = SqlDb();
  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController title = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController color = TextEditingController();

  @override
  void initState() {
    note =note;
    title = title;
    color = color;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: Text("Edit note"),
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
                   /* TextFormField(
                      controller: color,
                      decoration: InputDecoration(hintText: "color"),
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
                            int response = await sqlDb.updateData('''
              UPDATE notes SET 
              note = "${note.text}",
              title= "${title.text}",
              color= "${color.text}"
              WHERE id = ${widget.id}
''');
                            if (response > 0) {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => home1()),
                                  (route) => false);
                            }
                          },
                          child:Text("edit note",style: TextStyle(fontSize: 20,color: Colors.orange),),
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
