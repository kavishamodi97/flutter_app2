import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/SecondScreen.dart';
import 'package:flutter_app2/model/model.dart';
import 'package:flutter_app2/redux/actions.dart';
import 'package:flutter_app2/redux/reducers.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';
import 'package:path/path.dart';
import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:flutter_app2/redux/appstate.dart';
import 'package:flutter_app2/view/view.dart';
import 'dart:async';
import 'dart:convert';
import 'package:redux_dev_tools/src/store.dart';
import 'package:flutter_app2/view/MyHomePage.dart';
import 'package:flutter_app2/redux/reducers.dart';
import 'package:flutter_app2/redux/middleware.dart';
import 'package:flutter_app2/view/view.dart';

class state1 extends StatefulWidget {
  final DevToolsStore<AppState> store;

  state1(this.store);

  List<Record> records = new List<Record>();
  

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

       ViewModel viewModel = new ViewModel();
       viewModel.sample(records);
    return stateredux(store);
  }

  void display(List<Record> records) {
    MyHomePageState myHomePage = new  MyHomePageState(store);
    myHomePage.sampledata(records);
    buildBody(records);
  }

  void buildBody(List<Record> records) {
    StoreConnector<AppState, ViewModel>(
      converter: (Store<AppState> store) => ViewModel.create(store),
      builder: (BuildContext context, ViewModel viewModel) => Column(

      ),
    );
    drawer:
    container(
      child: ReduxDevTools(store),
    );
  }

  void container({ReduxDevTools<AppState> child}) {}
}

class stateredux extends State<state1>
{
  final DevToolsStore<AppState> store;
  stateredux(this.store);

  QuerySnapshot get q => null;

  List<Record> get records => null;



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return buildBody(context,records);
  }

  Widget buildBody(BuildContext context, List<Record> records ) {
    StoreConnector<AppState, ViewModel>(
      converter: (Store<AppState> store) => ViewModel.create(store),
      builder: (BuildContext context, ViewModel viewModel) => Column(
              
      ),
    );
    drawer:
    container(
      child: ReduxDevTools(store),
    );

  }


  Widget container({ReduxDevTools<AppState> child}) {}
}
