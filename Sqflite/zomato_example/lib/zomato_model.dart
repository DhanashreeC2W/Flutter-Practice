class ZomatoModel {
  String food;
  String custName;
  String hotelName;
  int orderNo;
  double bill;

  ZomatoModel(
      {required this.custName,
      required this.hotelName,
      required this.food,
      required this.orderNo,
      required this.bill});

  Map <String,dynamic>zomatoMap() {
    return {
      "food": food,
      "custName": custName,
      "hotelName": hotelName,
      "orderNo": orderNo,
      "bill": bill,
    };
  }
}
