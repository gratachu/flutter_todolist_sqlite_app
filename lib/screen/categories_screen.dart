import 'package:flutter/material.dart';
import 'package:flutter_todolist_sqlite_app/helpers/drawer_navigation.dart';
import 'package:flutter_todolist_sqlite_app/screen/home_screen.dart';

import '../models/category.dart';
import '../services/category_service.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final _categoryNameController = TextEditingController();
  final _categoryDescriptionController = TextEditingController();

  final _category = Category(name: '', description: '');
  final _categoryService = CategoryService();

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
            onPressed: () {
              _category.name = _categoryNameController.text;
              _category.description = _categoryDescriptionController.text;
              _categoryService.saveCategory(_category);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            child: const Text("Save"),
          )
        ],
        title: const Text("Category Form"),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
                TextField(
                  controller: _categoryNameController,
                  decoration: const InputDecoration(
                    labelText: "Category",
                    hintText: "Write category name"
                  ),
              ),
              TextField(
                controller: _categoryDescriptionController,
                decoration: const InputDecoration(
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
