import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// 主要底層圖片延伸
      extendBodyBehindAppBar: true,

      /// 最上面那條appBar
      appBar: appBar(),

      /// 左側drawer
      drawer: drawer(),

      /// 主頁面
      body:
      Image.asset(
        "assets/images/bg_test.jpg",
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }

  Drawer drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text("Drawer Header"),
          ),
          ListTile(
            title: const Text("Item 1"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Item 2"),
            onTap: () {},
          )
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      /// 中間標題文字
      // title: Text(
      //   "主頁",
      //   style: TextStyle(
      //     color: Colors.black,
      //     fontSize: 18,
      //     fontWeight: FontWeight.w500,
      //   ),
      // ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,

      /// 右側三個元件
      actions: [
        GestureDetector(
          /// 點擊跳轉到商店頁面
          onTap: () {},
          child: Row(
            children: [
              /// 錢符號
              Container(
                margin: EdgeInsets.all(5),
                alignment: Alignment.centerRight,
                width: 37,
                child: SvgPicture.asset(
                  "assets/icons/money-square.svg",
                  height: 20,
                  width: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              /// 錢數字
              Text("100"),

              /// 商店圖案
              Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                width: 40,
                child: SvgPicture.asset(
                  "assets/icons/cart-alt.svg",
                  height: 20,
                  width: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
