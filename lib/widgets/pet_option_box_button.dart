import 'package:flutter/material.dart';

class PetOptionBoxButton extends StatelessWidget {
  var pngPath;
  VoidCallback callback;

  PetOptionBoxButton(
    this.pngPath,
    this.callback,
  );

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      /// 長寬
      width: (size.width-(20*3))/3,
      height: (size.width-(20*3))/3,
      /// 外部間距
      margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
      /// 按鈕
      child: OutlinedButton(
        onPressed: callback,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          side: BorderSide(width: 3, color: Colors.grey),
        ),
        child: Image.asset(pngPath, height: 70,),
      ),
    );
  }
}
