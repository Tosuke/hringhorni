import 'package:flutter/material.dart';
import 'package:test_app/model/word_item.dart';
import 'package:test_app/model/word_bloc.dart';
import 'package:test_app/view/widgets/word_provider.dart';
import 'package:test_app/view/widgets/word_list_tile.dart';

class FavoriteWordsPage extends StatelessWidget {
  static const routeName = '/favorite';

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Saved Suggestions'),
      ),
      body: _buildBody(WordProvider.of(context)));
}

Widget _buildBody(WordBloc wordBloc) => StreamBuilder<Set<WordItem>>(
      stream: wordBloc.items,
      builder: (context, snapshot) {
        if (snapshot.data == null || snapshot.data.isEmpty) {
          return Center(
            child: Text('empty'),
          );
        }
        final tiles = snapshot.data.map((item) => WordListTile(
              item: item,
            ));
        final devided =
            ListTile.divideTiles(context: context, tiles: tiles).toList();
        return ListView(
          children: devided,
        );
      },
    );
