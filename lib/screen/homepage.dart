import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:news_app/Networking/article_fetching.dart';
import 'package:news_app/helper/category_list.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screen/category_view.dart';

import '../country_select.dart';
import 'article_view.dart';

class HomePage extends StatefulWidget {
  final countryName;
  HomePage(this.countryName);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = List<CategoryModel>();
  List<ArticleModel> newsarticle = List<ArticleModel>();
  bool _isLoading = true;
  Color _iconColor = Colors.blue;
  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews(widget.countryName);
    newsarticle = newsClass.newsArticles;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Flutter"),
            Text(
              "News",
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings, color: Colors.blue),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CountryPicker()));
            },
          ),
          IconButton(
              icon: Icon(
                Icons.lightbulb_outline,
                color: _iconColor,
              ),
              onPressed: () {
                setState(() {
                  if (_iconColor == Colors.black) {
                    _iconColor = Colors.blue;
                  } else {
                    _iconColor = Colors.black;
                  }
                });
                AdaptiveTheme.of(context).toggleThemeMode();
              }),
        ],
      ),
      body: _isLoading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 11),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                                text: 'Country : ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                                children: [
                                  TextSpan(
                                    text:
                                        '${widget.countryName.toString().toUpperCase()}',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  )
                                ])),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //Categories
                    Container(
                      height: 70,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return CategoryTile(
                                categories[index].imageUrl,
                                categories[index].categoryName,
                                widget.countryName);
                          }),
                    ),
                    //Posts
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: ListView.builder(
                          shrinkWrap: true,
                          // scrollDirection: Axis.vertical,
                          itemCount: newsarticle.length,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return BlogTile(
                              imageUrl: newsarticle[index].urlToImage,
                              description: newsarticle[index].description,
                              title: newsarticle[index].title,
                              url: newsarticle[index].url,
                              dateTime: newsarticle[index].publishedAt,
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final imageUrl, categoryName, countryName;
  CategoryTile(this.imageUrl, this.categoryName, this.countryName);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryView(
                      category: categoryName.toString().toLowerCase(),
                      country: countryName.toString().toLowerCase(),
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 8),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                width: 120,
                imageUrl: imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black38),
              alignment: Alignment.center,
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final imageUrl, title, description, url, dateTime;

  BlogTile(
      {this.imageUrl, this.description, this.title, this.url, this.dateTime});

  @override
  Widget build(BuildContext context) {
    String newDate;
    DateTime datTime = DateTime.parse(dateTime);
    newDate = Jiffy(datTime).format("MMMM do yyyy, h:mm:ss a");

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      url: url,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(imageUrl),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              newDate,
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
            ),
            SizedBox(
              height: 8,
            ),
            Text(description, style: TextStyle(color: Colors.black54)),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
