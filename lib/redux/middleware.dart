import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app2/model/model.dart';
import 'package:flutter_app2/redux/actions.dart';
import 'package:flutter_app2/redux/appstate.dart';
import 'package:flutter_app2/redux/reducers.dart';
import 'package:flutter_app2/redux/state.dart';
import 'package:flutter_app2/redux/middleware.dart';
import 'package:redux/redux.dart';
import 'package:flutter_app2/main.dart';

List<Middleware<AppState>> createStoreMiddleware() => [
      TypedMiddleware<AppState, SaveListAction>(_saveList),
      TypedMiddleware<AppState, fetchDataaction>(fetchlist),
    ];

Future _saveList(
    Store<AppState> store, SaveListAction action, NextDispatcher next) async {
  await Future.sync(
      () => Duration(seconds: 3)); // Simulate saving the list to disk
  next(action);
}

class DatabaseHepler {
  DatabaseHepler dh;

  //DatabaseHepler databaseHepler = new DatabaseHepler();

  //Reducer r1 = new TypedReducer(reducer);

  //static get reducer => null;

  // FutureOr Function(QuerySnapshot value) get onValue => null;

  //static get action => null;

  void deleteData(String docId) async {
    try {
      print(docId);
      var document = Firestore.instance.collection('baby').document(docId);
      await document.delete().then((result) {
        print('in delete data');
      });
    } catch (error) {
      print('error:$error');
    } //Firestore.instance.collection('baby').document(Firestore.i).
  }

  void fetchdata1() async {
    //databaseHepler.fetchdata();
    // reducer.fetchdata();
  }

  void updatedata(Record record) {
    Firestore.instance.runTransaction((transaction) async {
      final freshSnapshot = await transaction.get(record.reference);
      final fresh = Record.fromSnapshot(freshSnapshot);
      await transaction.update(record.reference, {'votes': fresh.votes + 1});
    });
  }

  void AddData(String name) async {
    var document = Firestore.instance.collection('baby').document();
    var map = new Map<String, dynamic>();
    map['name'] = name;
    map['votes'] = 0;
    var a = document.setData(map);
    return await a;
  }
}

void fetchlist(
    Store<AppState> store, fetchDataaction action, NextDispatcher next) {
  QuerySnapshot q;
  var querysnap = Firestore.instance.collection('baby').getDocuments();

  querysnap.then((query) {
    print(query);
    // Reducer r1 = new TypedReducer(reducer);
    // r1.fetchData(q);
  });
}

reducer(state, action) {}
