import 'dart:collection';
import 'package:english_words/english_words.dart';

final _Suggestion suggestion = _Suggestion();

class _Suggestion {
  final List<WordPair> _suggestions = <WordPair>[];

  _Suggestion();

  UnmodifiableListView<WordPair> get wordPairs => UnmodifiableListView(_suggestions);

  void add(WordPair pair) {
    _suggestions.add(pair);
  }

  void addMulti(Iterable<WordPair> pairs) {
    _suggestions.addAll(pairs);
  }
}