import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var dataList = [].obs;

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      await Future.delayed(Duration(seconds: 2));
      dataList.value = ["Item 1", "Item 2", "Item 3", "Item 4"];
      print(dataList);
    } finally {
      isLoading.value = false;
    }
  }
  
}
void main(){
  HomeController homeController = new HomeController() ;
  homeController.fetchData();
}