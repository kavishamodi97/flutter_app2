import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/SecondScreen.dart';
import 'package:flutter_app2/redux/middleware.dart';
import 'package:flutter_app2/redux/actions.dart';
import 'package:flutter_app2/redux/reducers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app2/main.dart';

class Item {
  final String name;
  final int votes;
  final bool completed;

  Item({
    this.name,
    this.votes,
    this.completed = false,
  });

  Item copywith({String name, int votes, bool completed}) {
    return Item(
      name: name ?? this.name,
      votes: votes ?? this.votes,
      completed: completed ?? this.completed,
    );
  }
}

class Record {
  final String name;
  final int votes;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['votes'] != null),
        name = map['name'],
        votes = map['votes'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$votes>";
}


