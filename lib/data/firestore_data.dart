import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/models/note_model.dart';
import 'package:uuid/uuid.dart';

class Firestore_Datasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> createUser(String email) async {
    try {
      await _firestore
          .collection("users")
          .doc(_firebaseAuth.currentUser!.uid)
          .set({'id': _firebaseAuth.currentUser!.uid, "email": email});
      return true;
    } catch (e) {
      print(e);
      return true;
    }
  }

  Future<bool> addNote(String subtitle, String title, int image) async {
    try {
      var uuid = Uuid().v4();
      DateTime date = new DateTime.now();
      await _firestore
          .collection("users")
          .doc(_firebaseAuth.currentUser!.uid)
          .collection("notes")
          .doc(uuid)
          .set({
        "id": uuid,
        "subTitle": subtitle,
        "title": title,
        "image": image,
        "time": "${date.hour}:${date.minute}",
        "isDone": false
      });
      return true;
    } catch (e) {
      print(e);
      return true;
    }
  }

  List getNotes(AsyncSnapshot snapshot) {
    try {
      final notesList = snapshot.data!.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return NoteModel(
            id: data["id"] as String? ?? "",
            subtitle: data["subtitle"] as String? ?? "",
            title: data["title"] as String? ?? "",
            time: data["time"] as String? ?? "",
            iamge: data["image"] as int,
            isDone: data["isDone"] as bool? ?? false);
      }).toList();

      return notesList;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Stream<QuerySnapshot> stream(bool isDone) {
    return _firestore
        .collection("users")
        .doc(_firebaseAuth.currentUser!.uid)
        .collection("notes")
        .where("isDone", isEqualTo: isDone)
        .snapshots();
  }

  Future<bool> isdone(String uuid, bool isDone) async {
    try {
      await _firestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection("notes")
          .doc(uuid)
          .update({"isDone": isDone});
      return true;
    } catch (e) {
      print(e);
      return true;
    }
  }

  Future<bool> updateNote(
      String uuid, int image, String title, String subtitle) async {
    try {
      DateTime date = new DateTime.now();
      await _firestore
          .collection("users")
          .doc(_firebaseAuth.currentUser!.uid)
          .collection("notes")
          .doc(uuid)
          .update({
        "time": "${date.hour}:${date.minute}",
        "title": title,
        "subtitle": subtitle,
        "image": image
      });
      return true;
    } catch (e) {
      print(e);
      return true;
    }
  }

  Future<bool> deleteNote(String uuid) async {
    try {
      await _firestore
          .collection("users")
          .doc(_firebaseAuth.currentUser!.uid)
          .collection("notes")
          .doc(uuid)
          .delete();
      return true;
    } catch (e) {
      print(e);
      return true;
    }
  }
}
