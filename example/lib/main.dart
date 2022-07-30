import 'package:flutter/material.dart';
import 'package:flutter_wannads/flutter_wannads.dart';
import 'package:flutter_wannads/wan_user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(children: [ ElevatedButton(
          onPressed: (){FlutterWannads.instance.init(
            apiKey: "62e1a9405eaad229634630", 
            apiSecret: "a4a55e0ab9", 
            user: WanUser(id: "test"),
            );},
          child: const Text('Init Wannads'),
        ),
        ElevatedButton(onPressed: (){FlutterWannads.instance.showOfferwall();}, child: const Text("Mostrar Offerwall")),
                ElevatedButton(onPressed: (){FlutterWannads.instance.showSurveysOfferwall();}, child: const Text("Mostrar SurveysOfferwall"))
        ],)
      ),
    );
  }
}
