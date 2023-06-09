import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'DataBase/database.dart';
import 'DataBase/tbldao.dart';
import 'View/HomeScreen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = await $FloorAppDatabase.databaseBuilder('Appdatabase.db').build();
  final tblDao = database.tblDao;
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp( MyApp(tblDao: tblDao,));
}

class MyApp extends StatelessWidget {
  TblDao? tblDao;
  MyApp({super.key,this.tblDao});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        useMaterial3: true
      ),
      home:  HomeScreen(tblDao: tblDao!),
    );
  }
}

