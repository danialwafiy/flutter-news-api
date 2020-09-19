import 'package:flutter/material.dart';
import 'package:newsApi/models/article.dart';
import 'package:newsApi/repository/news.dart';
import 'package:newsApi/widgets/news_tile.dart';

class CategoryPage extends StatefulWidget {
  final String category;
  CategoryPage({this.category});
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<Article> articles = new List<Article>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNews categoryNews = CategoryNews();
    await categoryNews.getCategoryNews(widget.category);
    articles = categoryNews.categoryNewsList;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('NEWS'),
            Text('API', style: TextStyle(color: Colors.blue))
          ],
        ),
        elevation: 0.0,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            return NewsTile(
                                imgUrl: articles[index].urlToImage,
                                title: articles[index].title,
                                description: articles[index].description,
                                url: articles[index].url);
                          }),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
