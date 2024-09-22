import 'package:demo/widgets/pet_option_box_button.dart';
import 'package:flutter/material.dart';

class PetPage extends StatefulWidget {
  const PetPage({super.key});

  @override
  State<PetPage> createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
  /// 選擇顯示哪一格
  String? selectedItem;
  /// 點擊出現，再次點擊消失
  void toggleItem(String item) {
    setState(() {
      if (selectedItem == item) {
        selectedItem = null; // 點擊相同的按鈕則隱藏
      } else {
        selectedItem = item; // 顯示選擇的項目
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    /// 抓螢幕的size
    final Size size = MediaQuery.of(context).size;

    return buildScaffold(size);
  }

  Scaffold buildScaffold(Size size) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          /// 左側面板
          Column(
            children: [
              /// 用這個方法控制
              changeLeftContent(size),
            ],
          ),
          Column(
            /// 右側
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              PetOptionBoxButton(
                  'assets/images/pet_option_box_png/mouse.png', () => toggleItem("寵物")),
              PetOptionBoxButton('assets/images/pet_option_box_png/birthday-hat.png', () => toggleItem("帽子")),
              PetOptionBoxButton(
                  'assets/images/pet_option_box_png/coat.png', () => toggleItem("上衣")),
              PetOptionBoxButton(
                  'assets/images/pet_option_box_png/shorts.png', () => toggleItem("褲子")),
            ],
          ),
        ],
      ),
    );
  }

  /// 切換左邊面板出現 & 內容
  Widget changeLeftContent(Size size) {
    switch (selectedItem) {
      case '寵物':
        return buildLeftContainer(
            size, Text('這裡顯示所有寵物的圖案', style: TextStyle(fontSize: 24)));
      case '帽子':
        return buildLeftContainer(
            size, Text('這裡顯示所有帽子的圖案', style: TextStyle(fontSize: 24)));
      case '上衣':
        return buildLeftContainer(
            size, Text('這裡顯示所有上衣的圖案', style: TextStyle(fontSize: 24)));
      case '褲子':
        return buildLeftContainer(
            size, Text('這裡顯示所有褲子的圖案', style: TextStyle(fontSize: 24)));
      default:
        return Center();
    }
  }

  /// 左邊面板畫面
  Container buildLeftContainer(Size size, Text text) {
    return Container(
      width: (size.width - (20 * 3)) / 3 * 2,
      height: (size.width - (20 * 3)) / 3 * 4 + (20 * 3),
      margin: EdgeInsets.only(left: 20, top: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 3, color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),

      /// 控制顯示
      child: text,
    );
  }
}
