import 'package:flutter/material.dart';

class CoolerWrapper extends StatefulWidget {
  const CoolerWrapper({super.key});

  @override
  State<CoolerWrapper> createState() => _CoolerWrapperState();
}

class _CoolerWrapperState extends State<CoolerWrapper> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white24,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height: 80,
              width: size.width,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: BNBCustomPainter(),
                  ),
                  Center(
                    heightFactor: 0.6,
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Colors.orange,
                      child: Icon(Icons.camera_alt_outlined,),
                      elevation: 0.1,
                      shape: const CircleBorder(),
                    ),
                  ),
                  Container(
                    height: 80,
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.home_outlined)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.pets_outlined)),
                        Container(width: size.width*0.20),
                        IconButton(onPressed: () {}, icon: Icon(Icons.sensor_occupied_outlined)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.book_outlined)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /// 畫板底圖
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    /// 曲線初始點 1.
    Path path = Path()..moveTo(0, 20);

    /// 曲線繪製
    /// 左側兩道曲線
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);

    /// 中間半圓
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(10.0), clockwise: false);

    /// 右側兩道曲線
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);

    /// 圖的直線連線
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, Colors.black, 5, true);

    /// 畫圖
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
  }
}
