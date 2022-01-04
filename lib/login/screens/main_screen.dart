import 'package:flutter/material.dart';
import 'package:flutter_project/description/location.dart';




import 'package:flutter_project/screens/settingspage.dart';
import 'package:flutter_project/screens/homes.dart';
import 'package:flutter_project/menu/my_home_page..dart';
import 'package:flutter_project/screens/imports2.dart';
import 'package:flutter_project/profile/pages/profile_page.dart';
import 'package:flutter_project/screens/searchpage.dart';
import 'package:share/share.dart';



class MainScreen extends StatelessWidget {
  final String _inputUsername;
  final String _inputPassword;
   MainScreen(
    this._inputUsername,
    this._inputPassword, {
    Key key,
  }) : super(key: key);

   ///////////////////////////////////

    /////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(),

          title: Text('Rez9i immobilier'),
          actions: [

            Icon(Icons.favorite),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child:  IconButton(
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => SearchPage())),
                icon: Icon(Icons.search),
              ),
            ),
            Icon(Icons.more_vert),
          ],
          backgroundColor: Colors.black,
        ),
        /////////////////////// splash screen
        drawer: Container(
            child: Drawer(
            child: ListView(
              // Remove padding
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text('Binary vision'),
                  accountEmail: Text('Binaryvision@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    child: ClipOval(
                      child: Image.network(
                        'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                        fit: BoxFit.cover,
                        width: 90,
                        height: 90,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          "https://upload.wikimedia.org/wikipedia/en/0/0b/Darth_Vader_in_The_Empire_Strikes_Back.jpg",)),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text('Favorites'),
                  onTap: () => null,
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('profile'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ProfilePage();
                        },
                      ),
                    );    },
                ),
                ListTile(
                  leading: Icon(Icons.my_location),
                  title: Text('location'),
                  onTap: () {
        Navigator.push(
        context,
        MaterialPageRoute(
        builder: (context) {
        return location();
        },
        ),
        );    },
                ),
                ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text('Request'),
                  onTap: () => null,
                  trailing: ClipOval(
                    child: Container(
                      color: Colors.red,
                      width: 20,
                      height: 20,
                      child: Center(
                        child: Text(
                          '8',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),

                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SettingsScreen();
                        },
                      ),
                    );    },
                ),
                ListTile(
                  leading: Icon(Icons.description),
                  title: Text('Policies'),
                  onTap: () => null,
                ),
                Divider(),
                ListTile(
                  title: Text('Exit'),
                  leading: Icon(Icons.exit_to_app),
                  onTap: () => null,
                ),
              ],
            ),
          )),



        body: MyHomePage(),


      ),
      );

  }
}