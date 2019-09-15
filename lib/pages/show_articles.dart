// PACKAGES
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' show jsonDecode;
// PAGES
import 'web_view_container.dart';
// MODELS
import '../models/category.dart';

class ShowArticles extends StatefulWidget {
  const ShowArticles({Key key, this.category}) : super(key: key);

  final Category category;

  @override
  ShowArticlesState createState() => ShowArticlesState();
}

class ShowArticlesState extends State<ShowArticles> {
  //For Fetched Articles from Json
  List _articlesList;

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    // Accesing Category's apiUrl From ShowArticles Class
    var _apiUrl = widget.category.apiUrl;

    // Storing JSON reponse to
    http.Response _jsonResponse = await http
        .get(Uri.encodeFull(_apiUrl), headers: {"Accept": "application/json"});

    // JSON Decoding
    var _jsonDecodedData = jsonDecode(_jsonResponse.body);

    // Assigning Fetched Articles To '_articlesList'
    if (this.mounted) {
      setState(() {
        _articlesList = _jsonDecodedData["articles"];
      });
    }

    return "success";
  }

  @override
  Widget build(BuildContext context) {
    var categoryTitle = widget.category.title;

    // WebView Widget
    void _webViewArticle(BuildContext context, String _articleUrl) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WebViewContainer(_articleUrl)));
    }

    // Articles Display
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Scaffold(
        body: Container(
          // Category's Title & Articles
          child: new SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Category's Title
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                  child: Text(
                    // Header: Category's Title
                    categoryTitle,
                    // Header Styling & Alignment
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Articles Iteration By ListView
                Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _articlesList == null ? 0 : _articlesList.length,
                    itemBuilder: (BuildContext context, int index) {

                      // Article's Variables
                      var _article = _articlesList[index];

                      var _articleUrl = _article['url'];
                      var _articleImageUrl = _article['urlToImage'];
                      var _articleSourceName = _article['source']["name"];
                      var _articleTitle = _article['title'];
                      var _articleDesc = _article['description'];

                      // Article
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        // Article Card Styling
                        decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8.0,
                              offset: Offset(0.0, 0.0),
                            )
                          ]
                        ),
                        child: Card(
                          margin: EdgeInsets.only(bottom: 15.0),
                          // Card Border Radius
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          // Tap To Call WebView Widget 
                          child: InkWell(
                            onTap: (){
                              _webViewArticle(context, _articleUrl);
                            },
                            child: Column(
                              children: <Widget>[
                                // Article Image
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10.0)),
                                  child: Image.network(_articleImageUrl),
                                ),
                              Container(
                                // Padding of Article SourceName, Title, Description
                                padding: EdgeInsets.fromLTRB(
                                  15.0,
                                  10.0,
                                  15.0,
                                  15.0,
                                ),
                                // SourceName, Title, Description
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    // SourceName
                                    Container(
                                      child: Text(
                                        _articleSourceName,
                                      ),
                                      margin: EdgeInsets.only(bottom: 5.0),
                                    ),
                                    // Title
                                    Container(
                                      margin: EdgeInsets.only(bottom: 5.0),
                                      child: Text(
                                        _articleTitle,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    // Description
                                    Container(
                                      child: Text(_articleDesc),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
