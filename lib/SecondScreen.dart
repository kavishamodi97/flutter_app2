import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/redux/actions.dart';
import 'package:flutter_app2/redux/middleware.dart';


class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {

  @override                                  // Add from this line ...
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Baby Name Votes')),
    body: _BuildName(context),
    );
  }                                          // ... to this line.
}

Widget _BuildName(BuildContext context) {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController voteController= TextEditingController();

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Column(
      children: <Widget>[
        TextField(
          controller: namecontroller,
          decoration: InputDecoration.collapsed(
              filled: true,
              hintText: "Enter a new name!!!"
          ),

        ),
        SizedBox(height: 20.0),

        TextField(
          controller: voteController,
          decoration: InputDecoration.collapsed(
              filled: true,
              hintText: "Enter your votes!!!"
          ),

        ),
        SizedBox(height: 20.0),

        ButtonBar(
          children: <Widget>[
            RaisedButton(
              child: Text('Save'),
              onPressed: (){

                Firestore.instance.runTransaction((transaction) async{
                  final DocumentSnapshot ds= await transaction.get(Firestore.instance.collection('baby').document());

                  var map = new Map<String,dynamic>();
                  map['name']=namecontroller.text;
                  map['votes']=0;
                  namecontroller.clear();
                  voteController.clear();
                  await transaction.set(ds.reference, map);

                  new AddItemAction(namecontroller.text);

                }

                );

              },

            ),

            RaisedButton(
              child: Text('Clear'),
              onPressed: (){
                namecontroller.clear();
                voteController.clear();

                new RemoveItemsAction();
              },

            ),


          ],
        ),

      ],
    ),
  );
}