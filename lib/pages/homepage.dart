// PACKAGES
import 'package:flutter/material.dart';
// PAGES
import './show_articles.dart';
// MODELS
import '../models/category.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categoryList.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          // Logo With App Name
          title: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                // Yellow Logo Box
                child: ConstrainedBox(
                  constraints: new BoxConstraints(
                    minHeight: 20.0,
                    minWidth: 20.0,
                    maxHeight: 20.0,
                    maxWidth: 20.0,
                  ),
                  child: new DecoratedBox(
                    decoration: new BoxDecoration(color: Colors.yellow),
                  ),
                ),
              ),
              // App Name
              Text(
                'REALBOX',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20.0,
                  letterSpacing: 8.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // Tab-Bars
          bottom: TabBar(
            isScrollable: true,
            // Iterating each category's Title from 'categoryList'
            tabs: categoryList.map((Category category) {
              return Tab(
                text: category.title,
              );
            }).toList(),
          ),
        ),
        body: TabBarView(
          // Iterating each category's Title from 'categoryList'
          children: categoryList.map((Category category) {
            return ShowArticles(category: category);
          }).toList(),
        ),
      ),
    );
  }
}
