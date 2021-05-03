import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instabuy_testinho/controllers/main_controller.dart';
import 'package:instabuy_testinho/views/home.dart';
import 'package:instabuy_testinho/widgets/title_row.dart';

class LoadingPage extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) {
        return HomePage();
      },
      onLoading: Scaffold(
        body: Container(
          color: Theme.of(context).primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleRow(
                title: 'Instabuy',
                icon: Icons.shopping_cart_outlined,
              ),
              Container(
                margin: EdgeInsets.only(top: 100),
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 10),
                    Text(
                      'Aguarde\n Estamos Preparando Tudo',
                      style: Theme.of(context).primaryTextTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
