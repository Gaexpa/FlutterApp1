import 'package:flutter/material.dart';

import '../../widgets/review_option_box_button.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "回顧",
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ReviewOptionBoxButton(size, "儲物欄", (){}),
              ReviewOptionBoxButton(size, "亂度空間紀錄", (){}),
              ReviewOptionBoxButton(size, "整理收納知識", (){}),
              ReviewOptionBoxButton(size, "成就", (){}),
            ],
          ),
        ),
      ),
    );
  }
}
