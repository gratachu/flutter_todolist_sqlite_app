import 'package:flutter/material.dart';
import '../screen/categories_screen.dart';
import '../screen/home_screen.dart';

class DrawerNavigation extends StatefulWidget {
  @override
  _DrawerNavigationState createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("https://avatars0.githubusercontent.com/u/19484515?s=460&v=4"),
              ),
              accountName: Text("Tatsuaki Ito"),
              accountEmail: Text("test@example.com"),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text("Home"),
              trailing: Icon(Icons.home),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            ListTile(
              title: Text("Categorie"),
              trailing: Icon(Icons.view_list),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CategoriesScreen()));
              },
            )
          ],
        )
      ),
    );
  }
}
