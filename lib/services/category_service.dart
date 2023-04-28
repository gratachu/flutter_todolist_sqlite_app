import 'package:flutter_todolist_sqlite_app/repositories/repository.dart';
import '../models/category.dart';

class CategoryService {
  Repository _repository = Repository();

  CategoryService() {
    _repository = Repository();
  }


  saveCategory(Category category) async {
    return await _repository.insertData('categories', category.categoryMap());
  }

  readCategories() async {
    return await _repository.readData('categories');
  }
}