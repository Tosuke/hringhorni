import 'package:flutter/material.dart';
import 'package:test_app/view/widgets/word_provider.dart';
import 'package:test_app/view/pages/random_words_page.dart';
import 'package:test_app/view/pages/favorite_words_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(primaryColor: Colors.white),
      routes: <String, WidgetBuilder>{
        RandomWordsPage.routeName: (_) => RandomWordsPage(),
        FavoriteWordsPage.routeName: (_) => FavoriteWordsPage()
      }
    );
    return WordProvider(
      child: app,
    );
  }
}
