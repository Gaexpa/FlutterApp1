import 'package:flutter/material.dart';

class ReviewOptionBoxButton extends StatelessWidget {
  Size size;
  var text;
  VoidCallback callback;

  ReviewOptionBoxButton(this.size, this.text, this.callback);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 20),
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          fixedSize: Size(size.width - 40, 140),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          side: BorderSide(
            color: Colors.grey,
            width: 3.0,
            style: BorderStyle.solid,
          ),
          backgroundColor: Colors.white,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 28, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
