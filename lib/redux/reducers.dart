import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app2/SecondScreen.dart';
import 'package:flutter_app2/model/model.dart';
import 'package:flutter_app2/redux/actions.dart';
import 'package:flutter_app2/redux/middleware.dart';
import 'package:redux/redux.dart';
import 'package:flutter_app2/redux/appstate.dart';
import 'package:flutter_app2/view/view.dart';
import 'package:flutter_app2/redux/state.dart';
import 'package:redux_dev_tools/src/store.dart';

AppState appStateReducer(AppState state, dynamic action) {
  return AppState(
    items: itemReducer(state.items, action),
  );
}

void fetchData(QuerySnapshot q) {
  ViewModel vm;
  List<DocumentSnapshot> snapshot = new List<DocumentSnapshot>();
  List<Record> records = new List<Record>();
  print('after snapshot');
  snapshot = q.documents;
  print(snapshot.length);
  print('before Records');
  for (DocumentSnapshot doc in snapshot) {
    records.add(Record.fromSnapshot(doc));
  }

  DevToolsStore<AppState> store;
  state1 s1 = new state1(store);

  s1.display(records);
}

Reducer<List<Item>> itemReducer = combineReducers<List<Item>>([
  TypedReducer<List<Item>, AddItemAction>(addItemReducer),
  TypedReducer<List<Item>, RemoveItemsAction>(removeItemsReducer),
  TypedReducer<List<Item>, RemoveItemsAction>(removeItemsReducer),
  TypedReducer<List<Item>, LoadedItemsAction>(loadItemsReducer),
  TypedReducer<List<Item>, ItemCompletedAction>(itemCompletedReducer),
  TypedReducer<List<Item>, fetchDataaction>(fetchReducer),
]);

List<Item> addItemReducer(List<Item> items, AddItemAction action) {
  return []
    ..addAll(items)
    ..add(Item(name: action.name, votes: action.votes));
}

List<Item> removeItemReducer(List<Item> items, RemoveItemAction action) {
  return List.unmodifiable(List.from(items)..remove(action.votes));
}

List<Item> removeItemsReducer(List<Item> items, RemoveItemsAction action) {
  return [];
}

List<Item> loadItemsReducer(List<Item> items, LoadedItemsAction action) {
  return action.items;
}

List<Item> itemCompletedReducer(List<Item> items, ItemCompletedAction action) {
  return items
      .map((item) => item.votes == action.item.votes
          ? item.copywith(completed: !item.completed)
          : item)
      .toList();
}

List<Item> fetchReducer(List<Item> items, fetchDataaction action) {
  QuerySnapshot q;
  ViewModel vm;
  List<DocumentSnapshot> snapshot = new List<DocumentSnapshot>();
  List<Record> records = new List<Record>();
  print('after snapshot');
  snapshot = q.documents;
  print(snapshot.length);
  print('before Records');
  for (DocumentSnapshot doc in snapshot) {
    records.add(Record.fromSnapshot(doc));
  }

  DevToolsStore<AppState> store;
  state1 s1 = new state1(store);

  s1.display(records);
}
