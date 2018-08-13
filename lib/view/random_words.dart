import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:test_app/model/suggestion.dart';
import 'package:test_app/model/word_item.dart';
import 'package:test_app/model/word_bloc.dart';
import 'package:test_app/view/word_provider.dart';

class RandomWords extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Startup Name Generator"),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.list),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => FavoritePage()));
                })
          ],
        ),
        body: _WordList());
  }
}

const _biggerFont = TextStyle(fontSize: 18.0);

class _WordList extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= suggestion.wordPairs.length) {
            suggestion.addMulti(generateWordPairs().take(10));
          }

          return _buildRow(WordProvider.of(context),
              WordItem(suggestion.wordPairs[index].asPascalCase));
        },
      );
}

class FavoritePage extends StatelessWidget {
  static const routeName = '/favorite';

  @override
  Widget build(BuildContext context) {
    final wordBloc = WordProvider.of(context);
    final body = StreamBuilder<Set<WordItem>>(
      stream: wordBloc.items,
      builder: (_, snapshot) {
        if (snapshot.data == null || snapshot.data.isEmpty) {
          return Center(child: Text('empty'),);
        }
        final tiles = snapshot.data.map((item) => _buildRow(wordBloc, item));
        final devided =
            ListTile.divideTiles(context: context, tiles: tiles).toList();
        return ListView(
          children: devided,
        );
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Suggestions'),
      ),
      body: body
    );
  }
}

Widget _buildRow(WordBloc wordBloc, WordItem item) {
  return StreamBuilder<Set<WordItem>>(
    stream: wordBloc.items,
    builder: (_, snapshot) {
      bool alreadyAdeded;
      if (snapshot.data == null || snapshot.data.isEmpty) {
        alreadyAdeded = false;
      } else {
        alreadyAdeded = snapshot.data.contains(item);
      }
      return ListTile(
          title: Text(
            item.name,
            style: _biggerFont,
          ),
          trailing: Icon(alreadyAdeded ? Icons.favorite : Icons.favorite_border,
              color: alreadyAdeded ? Colors.red : null),
          onTap: () {
            if (!alreadyAdeded) {
              wordBloc.addItem.add(item);
            } else {
              wordBloc.removeItem.add(item);
            }
          });
    },
  );
  /*return ListTile(
    title: Text(
      pair.asPascalCase,
      style: _biggerFont,
    ),
  );*/
}
