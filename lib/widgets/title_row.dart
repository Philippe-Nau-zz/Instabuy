import 'package:flutter/material.dart';

class TitleRow extends StatelessWidget {
  final String title;
  final IconData icon;
  TitleRow({@required this.title, @required this.icon});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(this.icon),
        Text(
          this.title,
          style: Theme.of(context).primaryTextTheme.headline4,
        ),
      ],
    );
  }
}
