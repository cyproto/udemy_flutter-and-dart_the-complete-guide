import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './add_place_screen.dart';
import '../providers/great_places.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.route);
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatPlaces>(
                child: Center(
                  child: Text('No places found'),
                ),
                builder: (ctx, greatPlaces, ch) => greatPlaces.items.length <= 0
                    ? ch
                    : ListView.builder(
                        padding: EdgeInsets.all(10),
                        itemCount: greatPlaces.items.length,
                        itemBuilder: (ctx, i) => ListTile(
                          contentPadding: EdgeInsets.all(10),
                          leading: CircleAvatar(
                            backgroundImage:
                                FileImage(greatPlaces.items[i].image),
                          ),
                          title: Text(
                            greatPlaces.items[i].title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Text(
                            greatPlaces.items[i].location.address,
                          ),
                          onTap: () {},
                        ),
                      ),
              ),
      ),
    );
  }
}
