class todomodel{
  String title;
  String discription;
  String date;
  int id;

  todomodel(
    {
    this.id=0,
    required this.date,
    required this.discription,
    required this.title,
  });
}