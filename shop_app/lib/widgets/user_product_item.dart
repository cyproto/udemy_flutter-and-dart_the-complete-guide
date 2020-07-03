import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  UserProductItem({this.title, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline4,
        ),
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(imageUrl),
        ),
        trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
