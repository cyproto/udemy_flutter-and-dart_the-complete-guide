import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(this.message, this.isCurrentUser, this.username, this.userImage,
      {this.key});
  final String message;
  final String username;
  final String userImage;
  final isCurrentUser;
  Key key;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          mainAxisAlignment:
              isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: isCurrentUser
                    ? Colors.grey[300]
                    : Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft:
                      !isCurrentUser ? Radius.circular(0) : Radius.circular(12),
                  bottomRight:
                      isCurrentUser ? Radius.circular(0) : Radius.circular(12),
                ),
              ),
              width: 140,
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              margin: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 8,
              ),
              child: Column(
                crossAxisAlignment: isCurrentUser
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    username,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isCurrentUser ? Colors.black : Colors.white,
                    ),
                  ),
                  Text(
                    message,
                    style: TextStyle(
                      color: isCurrentUser ? Colors.black : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: isCurrentUser ? null : 120,
          right: isCurrentUser ? 120 : null,
          child: CircleAvatar(
            backgroundImage: NetworkImage(userImage),
          ),
        ),
      ],
      overflow: Overflow.visible,
    );
  }
}
