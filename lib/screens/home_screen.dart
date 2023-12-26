import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todoapp/const/style.dart';
import 'package:todoapp/screens/add_note_screen.dart';
import 'package:todoapp/widgets/stream_note.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool show = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: Visibility(
          visible: show,
          child: FloatingActionButton(
            backgroundColor: custom_green,
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AddNoteScreen()));
            },
            child: Icon(
              Icons.add,
              size: 30,
            ),
          )),
      body: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            if (notification.direction == ScrollDirection.forward) {
              setState(() {
                show = true;
              });
            } else if (notification.direction == ScrollDirection.reverse) {
              setState(() {
                show = false;
              });
            }
            return true;
          },
          child: Column(
            children: [
              StreamNote(
                done: false,
              ),
              Text(
                "isDone",
                style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              StreamNote(
                done: true,
              ),
            ],
          )),
    );
  }
}
