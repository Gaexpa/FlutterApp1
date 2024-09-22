import 'package:flutter/material.dart';

class LevelOptionBoxButton extends StatelessWidget {
  Icon icon;
  VoidCallback callback;

  LevelOptionBoxButton(
    this.icon,
    this.callback,
  );

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: (size.width-48*2) / 2 - 5,
      height: 65,
      margin: EdgeInsets.only(left:5, top: 10, right: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          side: BorderSide(color:Colors.grey, width: 3.0, style: BorderStyle.solid),
        ),
        onPressed: callback,
        child: icon,
      ),
    );
  }
}
