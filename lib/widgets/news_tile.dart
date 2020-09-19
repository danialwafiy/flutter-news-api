import 'package:flutter/material.dart';
import 'package:newsApi/pages/article.dart';

class NewsTile extends StatelessWidget {
  final String imgUrl, title, description, url;
  NewsTile(
      {@required this.imgUrl,
      @required this.title,
      @required this.description,
      @required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context) => ArticlePage(url: url,)));},
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.only(top: 16),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imgUrl)),
            SizedBox(
              height: 8,
            ),
            Text(title,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500)),
            SizedBox(
              height: 8,
            ),
            Text(
              description,
              style: TextStyle(color: Colors.black54),
            )
          ],
        ),
      ),
    );
  }
}