import 'package:flutter/material.dart';
import 'package:flutter_project/menu/custom_animated_bottom_bar.dart';
import 'package:flutter_project/screens/choice_list.dart';
import 'package:flutter_project/screens/homes.dart';
import 'package:flutter_project/screens/imports.dart';
import 'package:flutter_project/screens/imports2.dart';
import 'package:flutter_project/screens/settingspage.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final _inactiveColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: getBody(),
        bottomNavigationBar: _buildBottomBar()
    );
  }

  Widget _buildBottomBar(){
    return CustomAnimatedBottomBar(
      containerHeight: 70,
      backgroundColor: Colors.black,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text('Homes'),
          activeColor : Colors.green,

          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.language),
          title: Text('lot'),
          activeColor: Colors.purpleAccent,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.message),
          title: Text(
            'Messages ',
          ),
          activeColor: Colors.pink,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.settings),
          title: Text('Settings'),
          activeColor: Colors.blue,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  bool _switchChoice = false;
  ChoicesList _radioChoice = ChoicesList.lot;
  Icon _radioIcon = const Icon(Icons.flight);

  final Map _mapTransport = {
    ChoicesList.house: false,
    ChoicesList.lot: false,
    ChoicesList.owner: false
  };

  double _sliderChoice = 7.0;
  Widget getBody() {
    List<Widget> pages = [
      Container(
        alignment: Alignment.center,
        child: imports()
      ),
      Container(
        alignment: Alignment.center,
        child: Imports(),
      ),
      Container(
        alignment: Alignment.center,
        child: Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(left: 16,right: 16,top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Conversations",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
                        Container(
                          padding: EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.pink[50],
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.add,color: Colors.pink,size: 20,),
                              SizedBox(width: 2,),
                              Text("Add New",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                            ],
                          ),

                        )
                      ],
                    ),

                  ),

                ),
              ],
            ),
          ),
        )
      ),



      Container(
        alignment: Alignment.center,
        child: SettingsScreen(),
      )
    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }


}