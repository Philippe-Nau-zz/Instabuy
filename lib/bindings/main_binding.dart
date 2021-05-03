import 'package:get/get.dart';
import 'package:instabuy_testinho/controllers/main_controller.dart';
import 'package:instabuy_testinho/data/repository/interface/main_repositoryInterface.dart';
import 'package:instabuy_testinho/data/repository/main_repository.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MainRepositoryInterface>(MainRepository());
    Get.put(MainController(Get.find()));
  }
}
