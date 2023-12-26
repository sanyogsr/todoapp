// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:todoapp/data/firestore_data.dart';
import 'package:todoapp/widgets/task_widget.dart';

class StreamNote extends StatelessWidget {
  final bool done;
  const StreamNote(
    {Key? key,
   required this.done,}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore_Datasource().stream(done),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }

        final noteList = Firestore_Datasource().getNotes(snapshot);
        return ListView.builder(
            itemCount: noteList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final note = noteList[index];
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  Firestore_Datasource().deleteNote(note.id);
                },
                child: TaskWidget(noteModel: note,),
              );
            });
      },
    );
  }
}
