import 'package:flutter/material.dart';
import 'package:flutter_todolist_sqlite_app/helpers/drawer_navigation.dart';
import 'package:flutter_todolist_sqlite_app/screen/home_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  _showFormDialog(BuildContext context){
    return showDialog(context: context, barrierDismissible: true, builder: (param){
      return AlertDialog(
        title: Text("Category Form"),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
                TextField(
                decoration: InputDecoration(
                  labelText: "Category Name",
                  hintText: "Write category name"
                ),
              ),
            ]
          )
        )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          child: const Icon(Icons.arrow_back),
        ),
        title: const Text("Categories"),
      ),
      drawer: DrawerNavigation(),
      body: Center(
        child: Text("Wlecome to Categories Screen"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormDialog(context);
        },
        child: const Icon(Icons.add),
      )
    );
  }
}
