import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/SecondScreen.dart';
import 'package:flutter_app2/model/model.dart';
import 'package:flutter_app2/redux/actions.dart';
import 'package:flutter_app2/redux/reducers.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';
import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app2/redux/appstate.dart';
import 'package:flutter_app2/view/view.dart';
import 'dart:async';
import 'dart:convert';
import 'package:redux_dev_tools/src/store.dart';

class MyHomePage extends StatefulWidget {
  final DevToolsStore<AppState> store;
  MyHomePage(this.store);

  @override
  MyHomePageState createState() {
    return MyHomePageState(store);
  }


}

class MyHomePageState extends State<MyHomePage> {
  final DevToolsStore<AppState> store;
  MyHomePageState(this.store);
  List<Record> _records = new List<Record>();

  fetchDataaction info;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text('Baby Name Votes'),
      ),
      body: buildList(context),
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RandomWords()),
            );
          }),
    );
  }


  _buildBody(BuildContext context) {
    // no action right now!!
  }


  Widget buildList(BuildContext context) {
    print(1);
    print(2);
    print(3);
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: _records.map((data) => _buildListItem(context,data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, Record record) {

    // final record1 = Record.fromSnapshot(data);
    return Padding(
      key: ValueKey(record.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(record.name),
          subtitle: Text(record.votes.toString()),
          trailing: GestureDetector(
              child: Icon(
                Icons.delete,
                color: Colors.lightBlue,
              ),
              onTap: () {
                _alertdialog(context, record);
                //fetchData(q);
              }),
        ),
      ),
    );
  }

  void sampledata(List<Record> records) {
    setState(() {
      _records=records;


    });
  }

  void _alertdialog(BuildContext context, Record record) {

    print(4);
    var alertDialog = AlertDialog(
      title: Text("Are You Sure want to delete?"),
      content: ButtonBar(
        children: <Widget>[
          RaisedButton(
            child: Text('Yes'),
            onPressed: () {
              const CircularProgressIndicator();
              SizedBox(
                width: 20.0,
                height: 20.0,
                child: CircularProgressIndicator(),
              );
//          _delete(context, data);

              Navigator.of(context).pop();
            },
          ),
          RaisedButton(
            child: Text('NO'),
            onPressed: () {
              // No Action
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}