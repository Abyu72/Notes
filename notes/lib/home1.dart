import 'package:flutter/material.dart';
import 'package:localdata/sqldb.dart';

import 'editenote.dart';

class home1 extends StatefulWidget {
  home1({Key? key}) : super(key: key);

  @override
  State<home1> createState() => _home1State();
}

class _home1State extends State<home1> {
  SqlDb sqlDb = SqlDb();
  List notes = [];
  bool isloading = true;
  Future<List<Map>> readData() async {
    List<Map> response = await sqlDb.readData("SELECT * FROM 'notes' ");
    notes.addAll(response);
    isloading = false;
    if (this.mounted) {
      setState(() {});
    }
    return response;
  }

  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My notes"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          Navigator.of(context).pushNamed("addnotes");
        },
        child: Icon(Icons.add),
      ),
      body: isloading == true
          ? Center(
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("loading..."),
                Container(child: CircularProgressIndicator())
              ],
            ))
          : Container(
              width: double.infinity,
              height: double.infinity,
              child: ListView(
                children: [
                  Container(
                    width: 100,
                    height: 40,
                    margin: EdgeInsets.all(10),
                    child: RaisedButton(
                      textColor: Colors.orange,
                      color: Colors.white,
                      onPressed: () async {
                        await sqlDb.mydeletdatabase();
                      },
                      child: Text(
                        "delete data",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  ListView.builder(
                      itemCount: notes.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, i) {
                        return Card(
                          margin: EdgeInsets.all(1),
                          child: ListTile(
                              title: Text("${notes[i]['note']}"),
                              subtitle: Text("${notes[i]['title']}"),
                              trailing: Container(
                                width: 150,
                                height: 180,
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () async {
                                          int response = await sqlDb.deletData(
                                              "DELETE FROM notes WHERE  id =${notes[i]['id']}");
                                          if (response > 0) {
                                            notes.removeWhere((element) =>
                                                element['id'] ==
                                                notes[i]['id']);
                                            setState(() {});
                                          }
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.orange,
                                        )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    IconButton(
                                        onPressed: () async {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      editnote(
                                                        color: notes[i]
                                                            ['color'],
                                                        title: notes[i]
                                                            ['title'],
                                                        note: notes[i]['note'],
                                                        id: notes[i]['id'],
                                                      )));
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          color: Colors.black,
                                        ))
                                  ],
                                ),
                              )),
                        );
                      })
                ],
              ),
            ),
    );
  }
}
