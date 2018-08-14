import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:english_words/english_words.dart';
import 'package:test_app/model/word_item.dart';

class SuggestionBloc {
  // Input
  final _addItems = StreamController<int>();
  Sink<int> get addItems => _addItems.sink;

  // Output
  Stream<List<WordItem>> _items;
  Stream<List<WordItem>> get items => _items;
  Stream<int> _itemsCount;
  Stream<int> get itemsCount => _itemsCount;

  SuggestionBloc() {
    _items = Observable(_addItems.stream).scan((acc, cur, i) {
      final words = generateWordPairs().take(cur).map((pair) => WordItem(pair.asPascalCase));
      acc.addAll(words);
      return acc;
    }, []);

    _itemsCount = _items.map((items) => items.length);
  }
}
