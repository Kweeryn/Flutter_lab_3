import 'package:lab3_2/models/ContactsModel.dart';
import 'package:lab3_2/models/CloseFriendsModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddContactForm extends StatefulWidget{
  @override
  State<AddContactForm> createState() {
    return _AddContactFormState();
  }
}

class _AddContactFormState extends State<AddContactForm>{
  final nameEditingController = TextEditingController();
  final phoneEditingController = TextEditingController();

  @override
  void dispose(){
    nameEditingController.dispose();
    phoneEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Add Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          TextField(
            controller: nameEditingController,
            decoration: InputDecoration(
              hintText: 'Name',
            ),
          ),
          TextField(
            controller: phoneEditingController,
            decoration: InputDecoration(
              hintText: 'Phone number',
            ),
          )
        ],),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          var contacts = context.read<ContactsModel>();
          var x = contacts.contacts.last.id;
          contacts.add(x+1, nameEditingController.text, phoneEditingController.text);
          Navigator.pop(context);
        },
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.person_add),
      ),
    );
  }
}

class AddContact extends StatelessWidget{
  set contact(ContactsModel contact){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AddContactForm(),
    );
  }

}