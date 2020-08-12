import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'message_bubble.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseAuth.instance.currentUser(),
      builder: (ctx, futureSnapshot) {
        if (futureSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return StreamBuilder(
          builder: (ctx, chatSnapshot) {
            if (chatSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final chatDocs = chatSnapshot.data.documents;
            return ListView.builder(
              reverse: true,
              itemBuilder: (ctx, index) {
                return MessageBubble(
                  chatDocs[index]['text'],
                  chatDocs[index]['userId'] == futureSnapshot.data.uid,
                  chatDocs[index]['username'],
                  chatDocs[index]['userImage'],
                  key: ValueKey(chatDocs[index].documentID),
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
      },
    );
  }
}
