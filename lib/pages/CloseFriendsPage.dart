import 'package:flutter/material.dart';
import 'package:lab3_2/models/CloseFriendsModel.dart';
import 'package:provider/provider.dart';


class MyCloseFriends extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Close Friends',),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: _CartList(),
              ),
            ),
            Divider(height: 4, color: Colors.black),
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var itemNameStyle = Theme.of(context).textTheme.headline6;
    // This gets the current state of CartModel and also tells Flutter
    // to rebuild this widget when CartModel notifies listeners (in other words,
    // when it changes).
    var closeFriends = context.watch<CloseFriendsModel>();

    return ListView.builder(
      itemCount: closeFriends.closeFriends.length,
      itemBuilder: (context, index) => ListTile(
        trailing: IconButton(
          icon: Icon(Icons.star),
        ),
        title: Text(
          closeFriends.closeFriends[index].name,
          //style: itemNameStyle,
        ),
      ),
    );
  }
}