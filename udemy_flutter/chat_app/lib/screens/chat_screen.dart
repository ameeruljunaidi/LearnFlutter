import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Chat App'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext ctx, int index) => Container(
          padding: const EdgeInsets.all(10.0),
          child: const Text('This works!'),
        ),
        itemCount: 10,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance
              .collection('chats/tYNQaD0ahpEpsYe5VFep/messages')
              .snapshots()
              .listen((QuerySnapshot data) {
            print(data.docs);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
