import 'package:flutter/material.dart';
import 'package:test_app/view/word_provider.dart';
import './random_words.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => WordProvider(
          child: MaterialApp(
        title: 'Startup Name Generator',
        theme: ThemeData(primaryColor: Colors.white),
        home: RandomWords(),
      ));
}
