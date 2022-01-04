import 'package:flutter/material.dart';



class location extends StatelessWidget {
  const location({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(

      ),
      home: const Mylocation(title: 'this is your location'),
    );
  }
}

class Mylocation extends StatefulWidget {
  const Mylocation({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<Mylocation> createState() => _MylocationState();
}

class _MylocationState extends State<Mylocation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Your location is:',
            ),
          ],
        ),
      ),
    );
  }
}
