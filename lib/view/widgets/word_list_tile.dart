import 'package:flutter/material.dart';
import 'package:test_app/model/word_item.dart';
import 'package:test_app/view/widgets/word_provider.dart';

const _biggerFont = TextStyle(fontSize: 18.0);

class WordListTile extends StatelessWidget {
  final WordItem item;

  WordListTile({@required this.item});

  @override
  Widget build(BuildContext context) {
    final wordBloc = WordProvider.of(context);
    return StreamBuilder<Set<WordItem>>(
        stream: wordBloc.items,
        initialData: Set(),
        builder: (_, snapshot) {
          final alreadyAdded = snapshot.data.contains(this.item);
          return ListTile(
            title: Text(
              this.item.name,
              style: _biggerFont,
            ),
            trailing: Icon(
                alreadyAdded ? Icons.favorite : Icons.favorite_border,
                color: alreadyAdded ? Colors.red : null),
            onTap: () {
              if (!alreadyAdded) {
                wordBloc.addItem.add(item);
              } else {
                wordBloc.removeItem.add(item);
              }
            },
          );
        });
  }
}
