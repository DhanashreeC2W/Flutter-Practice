class ZomatoModel {
  String userName;
  String food;
  int quantity;
  int? orderNo;

  ZomatoModel(
      {required this.userName,
      this.orderNo = 0,
      required this.food,
      required this.quantity});

  Map<String, Object> zomatoMap() {
    return {
      "name": userName,
      "food": food,
      "quantity": quantity,
      "orderNo": 0,
    };
  }
}
