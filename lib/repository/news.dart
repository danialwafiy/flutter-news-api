import 'dart:convert';
import 'package:newsApi/models/article.dart';
import 'package:http/http.dart' as http;

class News{
  List<Article> newsList = [];

  Future<void> getNews() async{
    String url = "https://newsapi.org/v2/top-headlines?country=my&apiKey=99963c91f422494d91e092dfc128483c";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if(jsonData['status'] == 'ok'){
      jsonData['articles'].forEach((e){
        if(e['urlToImage'] != null && e['description'] != null){
          Article article = Article(
            title:e['title'],
            author:e['author'],
            description:e['description'],
            url:e['url'],
            urlToImage:e['urlToImage'],
            content:e['content'],
          );
          newsList.add(article);
        }
      });
    }
  }
}

class CategoryNews{
  List<Article> categoryNewsList = [];

  Future<void> getCategoryNews(String category) async{
    String url = "https://newsapi.org/v2/top-headlines?category=$category&country=my&apiKey=99963c91f422494d91e092dfc128483c";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if(jsonData['status'] == 'ok'){
      jsonData['articles'].forEach((e){
        if(e['urlToImage'] != null && e['description'] != null){
          Article article = Article(
            title:e['title'],
            author:e['author'],
            description:e['description'],
            url:e['url'],
            urlToImage:e['urlToImage'],
            content:e['content'],
          );
          categoryNewsList.add(article);
        }
      });
    }
  }
}