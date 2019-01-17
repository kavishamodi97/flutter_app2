import 'package:flutter/material.dart';
import 'package:flutter_app2/redux/appstate.dart';
import 'package:flutter_app2/view/MyHomePage.dart';
import 'package:flutter_app2/redux/reducers.dart';
import 'package:redux_dev_tools/src/store.dart';
import 'package:flutter_app2/redux/middleware.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final DevToolsStore<AppState> store = DevToolsStore<AppState>(
    appStateReducer,
      initialState: AppState.initialState(),
      middleware: createStoreMiddleware(),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baby Names Votes',
      home: MyHomePage(this.store),
    );
  }
}

