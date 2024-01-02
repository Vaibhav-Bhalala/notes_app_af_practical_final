import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app_practical_test_af/Helpers/DB_Helper/db_helper.dart';
import 'package:notes_app_practical_test_af/modules/Model/notes_model.dart';

import '../Utils/globals.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController titlecontoller = TextEditingController();
    TextEditingController notecontoller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Get.offNamed('/favorite');
              },
              icon: Icon(
                CupertinoIcons.heart,
                color: Colors.white,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          "Notes",
          style: GoogleFonts.dmSans(
            textStyle: TextStyle(color: Colors.white),
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.deepOrangeAccent,
        onPressed: () {
          Get.defaultDialog(
              title: "Add Note",
              buttonColor: Colors.lime,
              confirm: ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState?.save();

                    Notes notes_data =
                        Notes(title: Globals.title, notes: Globals.notes);

                    int? res = await DBHelper.dbhelper
                        .insertnote(note_data: notes_data);
                    Get.snackbar(
                      "Notes App",
                      "Notes Successfully saved on $res....",
                    );

                    titlecontoller.clear();
                    notecontoller.clear();
                  }
                },
                child: Text(
                  "Save",
                  style: GoogleFonts.dmSans(),
                ),
              ),
              cancel: ElevatedButton(
                onPressed: () {
                  Get.back();
                  titlecontoller.clear();
                  notecontoller.clear();
                },
                child: Text(
                  "Cancel",
                  style: GoogleFonts.dmSans(),
                ),
              ),
              content: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter title..";
                        } else {
                          return null;
                        }
                      },
                      controller: titlecontoller,
                      onChanged: (val) {
                        Globals.title = val;
                      },
                      decoration: InputDecoration(
                          hintText: "Enter Title...",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter Note";
                        } else {
                          return null;
                        }
                      },
                      controller: notecontoller,
                      onChanged: (val) {
                        Globals.notes = val;
                      },
                      decoration: InputDecoration(
                          hintText: "Enter Notes...",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ],
                ),
              ));
        },
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
        label: Text(
          "Add Notes",
          style: GoogleFonts.dmSans(textStyle: TextStyle(color: Colors.white)),
        ),
      ),
      body: FutureBuilder(
        future: DBHelper.dbhelper.fetchNotesData(),
        builder: (ctx, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            List<Notes>? notesdata = snapshot.data;
            return ListView.builder(
                itemCount: notesdata!.length,
                itemBuilder: (ctx, i) {
                  return Card(
                    color: Colors.white,
                    elevation: 5,
                    child: ListTile(
                      tileColor: Colors.blueAccent.withOpacity(0.70),
                      title: Text(
                        "${notesdata[i].title}",
                        style: GoogleFonts.dmSans(
                            textStyle: TextStyle(fontSize: 35),
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "${notesdata[i].notes}",
                        style: GoogleFonts.dmSans(
                            textStyle: TextStyle(
                          fontSize: 25,
                        )),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          CupertinoIcons.delete,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          DBHelper.dbhelper.deleteNotes(id: notesdata[i].id!);
                        },
                      ),
                    ),
                  );
                });
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
