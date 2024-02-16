import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/models/show_category.dart';

class ShowCategoryNews {
  List<ShowCategoryModel> categorynews = [];

  Future<void> getCategoryNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=b0c0e014293e4f3ca239fc17192d742a";

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ShowCategoryModel categorymodel = ShowCategoryModel(
              title: element["title"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              content: element["content"],
              author: element["author"]);
          categorynews.add(categorymodel);
        }
      });
    }
  }
}
