class WordItem {
  final String name;
  const WordItem(this.name);

  @override
  String toString() => "$name";

  bool operator == (other) {
    if (other is WordItem) {
      return this.name == other.name;
    } else {
      return false;
    }
  }

  int get hashCode => this.name.hashCode;
}