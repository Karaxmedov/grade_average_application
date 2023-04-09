class Lesson {
  final String name;
  final double letterValue;
  final int creditValue;

  Lesson(
      {required this.name,
      required this.letterValue,
      required this.creditValue});
  @override
  String toString() {
    return "$name $letterValue $creditValue";
  }
}
