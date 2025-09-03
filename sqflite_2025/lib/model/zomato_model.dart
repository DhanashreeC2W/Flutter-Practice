class ZomatoModel {
  final String userName;
  String food;
  int quantity;
  int orderNo;

  ZomatoModel(
      {required this.userName,
      required this.orderNo,
      required this.food,
      required this.quantity});

  Map<String,Object> zomatoMap() {
    return {
      "userName": userName,
      "food": food,
      "quantity": quantity,
      "orderNo": orderNo,
    };
  }
}
