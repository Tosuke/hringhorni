import 'package:flutter/material.dart';
import 'package:test_app/model/word_item.dart';
import 'package:test_app/view/widgets/suggestion_provider.dart';
import 'package:test_app/view/widgets/word_list_tile.dart';

class RandomWordsPage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Startup Name Generator"),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.list),
                onPressed: () {
                  Navigator.of(context).pushNamed('/favorite');
                })
          ],
        ),
        body: SuggestionProvider(
          child: _WordList(),
        ));
  }
}

class _WordList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final suggestionBloc = SuggestionProvider.of(context);
    return StreamBuilder<List<WordItem>>(
      stream: suggestionBloc.items,
      initialData: [],
      builder: (context, snapshot) => ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemBuilder: (context, i) {
              if (i.isOdd) return Divider();

              final index = i ~/ 2;
              final items = snapshot.data;
              if (index >= items.length) {
                suggestionBloc.addItems.add(10);
                return ListTile(
                  title: Text('loading'),
                );
              } else {
                return WordListTile(
                  item: items[index],
                );
              }
            },
          ),
    );
  }
}