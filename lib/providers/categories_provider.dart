import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/models/https/categires_response.dart';
import 'package:flutter/material.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Categoria> categorias = [];

  getCategories() async {
    final resp = await CafeApi.httpGet('/categorias');
    final categoriesResp = CategoriesResponse.fromMap(resp);

    categorias = [...?categoriesResp.categorias];

   
    notifyListeners();
  }

  Future newCategory(String name) async {
    final data = {'nombre': name};

    try {
      final json = await CafeApi.httpPost('/categorias', data);
      final newCategory = Categoria.fromMap(json);
      categorias.add(newCategory);
      notifyListeners();
    } catch (e) {
      throw ('error en el post $e');
    }
  }

  Future editCategory(String name, idCategoria) async {
    final data = {'nombre': name};

    try {
     await CafeApi.httpPut('/categorias/$idCategoria', data);
      // final editCategory = Categoria.fromMap(json);

      // for (var element in categorias) {
      //   if (element.id == idCategoria) {
      //     print(element.nombre);

      //     element.nombre = json['nombre'];
      //   }
      // }
      categorias = categorias.map((category) {
        if (category.id != idCategoria) return category;

        category.nombre = name;
        return category;
      }).toList();

      notifyListeners();
    } catch (e) {
      throw ('error en el post $e');
    }
  }

    Future deleteCategory(String idCategoria) async {
   

    try {
      await CafeApi.httpDelete('/categorias/$idCategoria');
     
      categorias.removeWhere((element) => element.id == idCategoria);

      notifyListeners();
    } catch (e) {
      throw ('error en el post $e');
    }
  }
}
