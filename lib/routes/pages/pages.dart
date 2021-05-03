import 'package:get/get.dart';
import 'package:instabuy_testinho/views/description_product.dart';
import 'package:instabuy_testinho/views/home.dart';
import 'package:instabuy_testinho/views/loading_page.dart';

import '../routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => LoadingPage(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.DESCRIPTION,
      page: () => DescriptionProduct(),
    ),
  ];
}
