import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app2/SecondScreen.dart';
import 'package:flutter_app2/model/model.dart';
import 'package:flutter_app2/redux/middleware.dart';

class AddItemAction {
  static int _votes = 0;
   String name;

  AddItemAction(this.name) {
    _votes++;
  }

  //DatabaseHepler dh =new DatabaseHepler();
  //dh.AddData(name); // ignore: invalid_constructor_name

  int get id => _votes;

  get votes => null;
}

class RemoveItemAction {
  final Item votes;

  RemoveItemAction(this.votes);
}

class RemoveItemsAction {}

class DisplayListOnlyAction {



}

class SaveListAction {}

class GetItemsAction {}

class LoadedItemsAction {
  final List<Item> items;

  LoadedItemsAction(this.items);
}

class ItemCompletedAction {
  final Item item;

  ItemCompletedAction(this.item);
}

class  deleteData{
final int docId;
deleteData(this.docId);
}


class updatedata{
  final String record;
  updatedata(this.record);
}


class AddData{

  final String name;
  AddData(this.name);
}

class fetchDataaction{
 // todo: !!
}