import 'dart:async';
import 'package:rxdart/subjects.dart';
import 'package:test_app/model/word_item.dart';

class WordBloc {
  // Input
  final _addItem = BehaviorSubject<WordItem>();
  Sink<WordItem> get addItem => _addItem.sink;
  
  final _removeItem = BehaviorSubject<WordItem>();
  Sink<WordItem> get removeItem => _removeItem.sink;

  // Output
  final _items = BehaviorSubject<Set<WordItem>>();
  Stream<Set<WordItem>> get items => _items.stream;

  final _saved = Set<WordItem>();

  WordBloc() {
    _items.add(_saved);
    
    _addItem.stream.listen((item) {
      _saved.add(item);
      _items.add(_saved);
    });

    _removeItem.stream.listen((item) {
      _saved.remove(item);
      _items.sink.add(_saved);
    });
  }
}
