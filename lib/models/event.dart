class Event {
  final String? id;

  final String name;

  final int start;

  final int end;

  final String weekday;

  Event(
      {this.id,
      required this.name,
      required this.start,
      required this.end,
      required this.weekday});

  List<String> getClassAttributes() => ['name', 'start', 'end', 'weekday'];

  getAttributeValueOf(String attribute) {
    switch (attribute) {
      case 'name':
        return name;
      case 'start':
        return start;
      case 'end':
        return end;
      case 'weekday':
        return weekday;
    }
  }
}
