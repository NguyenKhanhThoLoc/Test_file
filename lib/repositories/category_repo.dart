import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/category_model.dart';

class CategoryRepository {
  Future<List<Category>> getLanguage()   async {
    const url =
        'https://apiforlearning.zendvn.com/api/v2/category_programming_quiz?limit=100&page=1';
    final response = await http.get(Uri.parse(url));
    List data = jsonDecode(response.body)['data'];
    List<Category> categories = List<Category>.from(
        data.map((e) => Category.fromJson(jsonEncode(e))).toList());
    return categories;
  }

  Future<List<Category>> getTopic(int id) async {
    final url =
        'https://apiforlearning.zendvn.com/api/v2/category_programming_quiz/$id/topics';
    final response = await http.get(Uri.parse(url));
    List data = jsonDecode(response.body)['data'];
    List<Category> categories = List<Category>.from(
        data.map((e) => Category.fromJson(jsonEncode(e))).toList());
    return categories;
  }
}
