import 'package:flutter/material.dart';
import 'package:flutter_atomic_widgets/atomic_widgets.dart';
TextEditingController  InputController = TextEditingController();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[


            customTextFormField("Username", InputController, TextInputType.text, true),

            SizedBox(height: 20,),

            customElevatedButton("My Custom Button", Colors.black, Colors.white, 10, () {
              print("Clicked Elevated Button");
              print("Login info: ${InputController.text}");
            })

          ],
        ),
      ),

    );
  }
}
