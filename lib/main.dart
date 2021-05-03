import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instabuy_testinho/bindings/main_binding.dart';
import 'package:instabuy_testinho/routes/pages/pages.dart';
import 'package:instabuy_testinho/routes/routes.dart';
import 'package:instabuy_testinho/views/description_product.dart';
import 'package:instabuy_testinho/views/loading_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.orange[700],
        primaryColor: Colors.orange[700],
        accentColor: Colors.orange,
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 40,
        ),
        primaryTextTheme: TextTheme(
          headline4: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          headline5: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 1,
          ),
          headline6: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
            fontSize: 18,
          ),
        ),
        textTheme: TextTheme(
          headline3: TextStyle(
            color: Colors.grey[700],
            fontSize: 16,
          ),
          headline4: TextStyle(
            color: Colors.orange[700],
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
          headline5: TextStyle(
            color: Colors.orange[700],
            fontWeight: FontWeight.bold,
          ),
          headline6: TextStyle(
            color: Colors.grey,
            decoration: TextDecoration.lineThrough,
          ),
        ),
      ),
      getPages: AppPages.pages,
      initialRoute: Routes.INITIAL,
      title: 'Instabuy',
      initialBinding: MainBinding(),
      home: LoadingPage(),
    );
  }
}
