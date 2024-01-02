class Notes {
  int? id;
  String? title;
  String? notes;

  Notes({this.id, required this.title, required this.notes});

  factory Notes.fromSQL({required Map data}) {
    return Notes(
      title: data['title'],
      notes: data['notes'],
      id: data['id'],
    );
  }
}
