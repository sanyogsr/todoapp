import 'package:flutter/material.dart';
import 'package:todoapp/const/style.dart';
import 'package:todoapp/data/firestore_data.dart';
import 'package:todoapp/models/note_model.dart';

class EditNoteScreen extends StatefulWidget {
  final NoteModel noteModel;
  const EditNoteScreen(this.noteModel, {Key? key}) : super(key: key);

  @override
  _EditNoteScreenState createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  final title = TextEditingController();
  final subTitle = TextEditingController();

  FocusNode _focusNodeTitle = FocusNode();
  FocusNode _focusNodeSubTitle = FocusNode();
  int indexx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "Add Your Task",
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            SizedBox(
              height: 40,
            ),
            titleWidget(),
            SizedBox(
              height: 20,
            ),
            subTitleWidget(),
            SizedBox(
              height: 20,
            ),
            images(),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            button()
          ],
        ),
      )),
    );
  }

  Widget titleWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: TextField(
          controller: title,
          focusNode: _focusNodeTitle,
          style: TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
              hintText: "title",
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xffc5c5c5), width: 2.0)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: custom_green, width: 2.0))),
        ),
      ),
    );
  }

  Widget subTitleWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: TextField(
          maxLines: 3,
          controller: subTitle,
          focusNode: _focusNodeSubTitle,
          style: TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
              hintText: "subtitle",
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xffc5c5c5), width: 2.0)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: custom_green, width: 2.0))),
        ),
      ),
    );
  }

  Widget images() {
    return Container(
      height: 180,
      child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  indexx = index;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: index == 0 ? 7 : 0),
                child: Container(
                  margin: EdgeInsets.all(8),
                  width: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 2,
                          color: indexx == index ? custom_green : Colors.grey)),
                  child: Column(
                    children: [
                      Image.asset("images/${index}.png"),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget button() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: custom_green, minimumSize: Size(170, 48)),
            onPressed: () {
              Firestore_Datasource().updateNote(
                  widget.noteModel.id, indexx, title.text, subTitle.text);
              Navigator.pop(context);
            },
            child: Text("Add Task")),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, minimumSize: Size(170, 48)),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel"))
      ],
    );
  }
}
