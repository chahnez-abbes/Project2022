import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_project/description/location.dart';
import 'dart:convert';

import 'package:flutter_project/profile/pages/profile_page.dart';
import 'package:string_validator/string_validator.dart';


class  Course {
  String id;
  String title;
  String description;
  String image;
  String last_update;
  String owner_name;
  String city;
  num price;


  Course({
     this.id,
     this.title,
    this.description,
     this.image,
     this.last_update,
     this.owner_name,
     this.city,
     this.price,

  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        image: json['image'],
        last_update: json['last_update'],
        owner_name: json['owner_name'],
        city: json['city'],
        price: json['price'],

    );
  }
}
// ----------------------------------------données-------------------------------

class imports extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.black,
      home:  MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {




  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  final String url = 'https://mocki.io/v1/f5ecb027-79ee-4ac7-849d-b316b2d9e472';
  List<dynamic> _courses = [];
  bool loading = true;

  @override
  void initState() {
    getCourses();
    super.initState();
  }

  Future<void> getCourses() async  {
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200) {
      final parsedData = jsonDecode(response.body).cast<Map<String, dynamic>>();
      _courses = parsedData.map<Course>((json) => Course.fromJson(json)).toList();
      setState(() {
        loading = !loading;
      });
    } else {
      throw Exception('Failed to load ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: loading ? waitingScreen() : coursesList()
    );
  }

  Widget waitingScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text("Loading data ..."),
          Padding(padding: EdgeInsets.only(bottom: 25)),
          CircularProgressIndicator()
        ],
      ),
    );
  }
  static const routeName = '/extractArguments';
  Widget coursesList() {

    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemCount: _courses.length,
        itemBuilder: (context, index) {

          trailing: Icon(Icons.favorite_border);
          Course course = _courses[index];
          return Center(
            child: Card(
                color: Colors.green.withOpacity(0.5),
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.push(

                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return
                            PassArgumentsScreen(
                            title: course.title,
                             id: course.id,
                                description: course.description,
                                image: course.image,
                                last_update: course.last_update,
                                owner_name: course.owner_name,
                                city:course.city,
                                price:course.price,
                          );
                          //ScreenArguments(course.title, course.image, course.owner_name, course.id, course.description, course.last_update, course.city, course.price),

                          },
                      ),
                    );    },

                child: Container(

              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                      child: Image.network(course.image)
                  ),
                  const Divider(color: Colors.white),
                  Text(
                    course.title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                    textAlign: TextAlign.start,
                  ),

                  Text(

                    "TND${course.price.toString()}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          )));
        }
    );
  }
 /* Widget _blueRectangle(Size size) {
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.blue,
    );
  } */







}

class PassArgumentsScreen extends StatelessWidget {
  static const routeName = '/passArguments';

  final String title;

  final String id;
  final String description;
  final String image;
  final String last_update;
  final String owner_name;
  final String city;
  final num price;

  // This Widget accepts the arguments as constructor
  // parameters. It does not extract the arguments from
  // the ModalRoute.
  //
  // The arguments are extracted by the onGenerateRoute
  // function provided to the MaterialApp widget.
  const PassArgumentsScreen({
    Key key,
    this.title,
   this.id, this.description, this.image, this.last_update, this.owner_name, this.city, this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(title),
      ),
      body: Center(
        child: Container (

          child: Row(


            children:[
              Expanded (
                child: Banner (
                message: city,
                location: BannerLocation.topEnd,
                color: Colors.red,
                child: Container(
                  height: 186,
                  width: 280,
                  child: Image.network(
                 image,
                    fit: BoxFit.cover,
                  ),


                ),
              ),),
              Expanded(child:Text(title),
              ),
              Expanded(child:Text(description),),
              Expanded(
                child:Text(toString(price)),
              ),


            ]),)

      ),
    );
  }
}
class ExtractArgumentsScreen extends StatelessWidget {
  const ExtractArgumentsScreen({Key key}) : super(key: key);

  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.
    final args = ModalRoute.of(context).settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.image),

      ),
    );
  }
}




class ScreenArguments {
  final String id;
final   String title;
 final String description;
 final String image;
 final String last_update;
 final String owner_name;
  final String city;
 final num price;

  ScreenArguments(this.title, this.image,this.owner_name, this.id, this.description, this.last_update, this.city, this.price);
}

