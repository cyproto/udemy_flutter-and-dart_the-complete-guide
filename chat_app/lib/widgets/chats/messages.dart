import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (ctx, chatSnapshot) {
        if (chatSnapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        final chatDocs = chatSnapshot.data.documents;
        return ListView.builder(
          reverse: true,
          itemBuilder: (ctx, index) {
            return Text(
              chatDocs[index]['text'],
            );
          },
          itemCount: chatDocs.length,
        );
      },
      stream: Firestore.instance
          .collection('chat')
          .orderBy('timestamp', descending: true)
          .snapshots(),
    );
  }
}
