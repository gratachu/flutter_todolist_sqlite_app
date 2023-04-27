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
        actions: <Widget>[
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
            ),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            ),
            child: const Text("Save"),
          )
        ],
        title: const Text("Category Form"),
        content: SingleChildScrollView(
          child: Column(
            children: const <Widget>[
                TextField(
                decoration: InputDecoration(
                  labelText: "Category",
                  hintText: "Write category name"
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Description",
                  hintText: "Write category description"
                ),
              )
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
      body: const Center(
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
