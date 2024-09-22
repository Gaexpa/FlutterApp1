import 'package:demo/widgets/level_option_box_button.dart';
import 'package:flutter/material.dart';

class LevelPage extends StatefulWidget {
  const LevelPage({super.key});

  @override
  State<LevelPage> createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return buildScaffold(size);
  }

  Scaffold buildScaffold(Size size) {
    return Scaffold(
    appBar: AppBar(
      title: Text(
        "關卡",
        style: TextStyle(fontSize: 30),
      ),
      centerTitle: true,
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 切換房間的Container按鈕
        Container(
          margin: EdgeInsets.only(left: 48, top: 20, right: 20, bottom: 20),
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              fixedSize: Size(225, 45),
              backgroundColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/level/room.png',
                  height: 40,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "臥室A",
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
              ],
            ),
          ),
        ),

        /// 房間局部名
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 20),
          child: Text(
            "書架",
            style: TextStyle(fontSize: 25),
          ),
        ),

        /// 中間 < 圖 >
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_ios_outlined,
              ),
            ),
            Column(
              children: [
                Image.asset(
                  'assets/images/level/bookshelf.jpg',
                  width: size.width - 48 * 2,
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_forward_ios_outlined),
            ),
          ],
        ),

        /// 最下方兩顆按鈕
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LevelOptionBoxButton(
                Icon(
                  Icons.camera_alt_outlined,
                  size: 50,
                ),
                () {}),
            LevelOptionBoxButton(
                Icon(
                  Icons.photo_outlined,
                  size: 50,
                ),
                () {}),
          ],
        ),
      ],
    ),
  );
  }
}
