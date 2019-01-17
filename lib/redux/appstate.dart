import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app2/SecondScreen.dart';
import 'package:flutter_app2/model/model.dart';
import 'package:flutter_app2/redux/actions.dart';

class AppState {
  final List<Item> items;

  AppState({
    this.items,
  });

  AppState.initialState() : items = List.unmodifiable(<Item>[]);
}
