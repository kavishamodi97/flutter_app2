import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app2/SecondScreen.dart';
import'package:flutter_app2/model/model.dart';
import 'package:flutter_app2/redux/actions.dart';
import 'package:redux/redux.dart';
import 'package:flutter_app2/redux/appstate.dart';
import 'package:flutter_app2/main.dart';
import 'package:flutter_app2/view/MyHomePage.dart';
import 'package:flutter_app2/redux/state.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:flutter_app2/redux/state.dart';
import 'package:flutter_app2/redux/reducers.dart';


class ViewModel {
  final DevToolsStore<AppState> store;
  final List<Item> items;
  final Function(Item) onCompleted;
  final Function(String) onAddItem;
  final Function(Item) onRemoveItem;
  final Function() onRemoveItems;


  ViewModel({
    this.items,
    this.onCompleted,
    this.onAddItem,
    this.onRemoveItem,
    this.onRemoveItems,
    this.store,

  });

  factory ViewModel.create(Store<AppState> store) {
    _onAddItem(String name) {
      store.dispatch(AddItemAction(name));
    }

    _onRemoveItem(Item item) {
      store.dispatch(RemoveItemAction(item));
    }

    _onRemoveItems() {
      store.dispatch(RemoveItemsAction());
    }

    _onCompleted(Item item) {
      store.dispatch(ItemCompletedAction(item));
    }


    return ViewModel(
      items: store.state.items,
      onCompleted: _onCompleted,
      onAddItem: _onAddItem,
      onRemoveItem: _onRemoveItem,
      onRemoveItems: _onRemoveItems,
    );
  }

   void showRecords(List<Record> records) {}

  void sample(List<Record> records) {


  }

}
