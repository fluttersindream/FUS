import 'package:FUS/config/style.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {

  final ButtonModel bm;
  ButtonWidget(this.bm);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      highlightedBorderColor: Style.red,
      splashColor: Style.orange,
      highlightColor: Style.red,
      onPressed: () => bm.func(),
      child: Text(bm.name),
    );
  }
}


class ButtonModel {
  final Function func;
  final String name;

  ButtonModel(this.func, this.name);
}
