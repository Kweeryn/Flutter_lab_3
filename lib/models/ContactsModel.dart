
import 'package:flutter/material.dart';

class ContactsModel extends ChangeNotifier{
  List<Contact> contacts = [
    Contact(0, "Name1", "0993336699")
  ];


  Contact getByPosition(int position) {
    return contacts[position];
  }

  void add(int id, String name,  String number) {
    contacts.add(Contact(id, name, number));
    notifyListeners();
  }
}

@immutable
class Contact {
  final int id;
  final String name;
  final String number;

  Contact(this.id, this.name, this.number);

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Contact && other.id == id;
}