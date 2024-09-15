import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PetOptionBoxButton extends StatelessWidget {
  IconData buttonIcon;
  VoidCallback callback;

  PetOptionBoxButton(
    this.buttonIcon,
    this.callback,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      /// 長寬
      width: 113,
      height: 113,
      /// 外部間距
      margin: EdgeInsets.all(5),
      /// 按鈕
      child: OutlinedButton(
        onPressed: callback,
        child: Icon(buttonIcon, size: 40,),
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          side: BorderSide(width: 3, color: Colors.grey),
        ),
      ),
    );
  }
}
