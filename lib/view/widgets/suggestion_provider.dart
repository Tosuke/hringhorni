import 'package:flutter/widgets.dart';
import 'package:test_app/model/suggestion_bloc.dart';

class SuggestionProvider extends InheritedWidget {
  final SuggestionBloc suggestionBloc;

  SuggestionProvider({
    Key key,
    SuggestionBloc suggestionBloc,
    Widget child,
  })  : suggestionBloc = suggestionBloc ?? SuggestionBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static SuggestionBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(SuggestionProvider)
              as SuggestionProvider)
          .suggestionBloc;
}
