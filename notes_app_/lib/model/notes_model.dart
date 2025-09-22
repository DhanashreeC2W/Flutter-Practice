class NotesModel {
  final String title;
  final String decr;
  final String img;
  final int id;

  const NotesModel(
      {required this.title,
      required this.decr,
      required this.img,
      this.id = 0});
}
