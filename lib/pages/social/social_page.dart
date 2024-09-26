import 'package:demo/widgets/social_card.dart';
import 'package:demo/widgets/social_ranking_avatar_circle.dart';
import 'package:flutter/material.dart';

class SocialPage extends StatefulWidget {
  const SocialPage({super.key});

  @override
  State<SocialPage> createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "社交",
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 排行那一塊
          Container(
            margin: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 20),
            width: size.width - 40,
            height: 105,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 3, color: Colors.grey),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 排行文字
                Container(
                  margin:
                      EdgeInsets.only(left: 10, top: 5, right: 5, bottom: 5),
                  child: Text(
                    "排行",
                    style: TextStyle(fontSize: 18),
                  ),
                ),

                /// 顯示好友頭貼的可滑動列表
                Scrollbar(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding:
                        EdgeInsets.only(left: 10, top: 5, right: 5, bottom: 5),
                    child: Row(
                      children: [
                        // 排行最多10個
                        SocialRankingAvatarCircle(
                            "assets/images/avatar_sample/female-avatar.png"),
                        SocialRankingAvatarCircle(
                            "assets/images/avatar_sample/male-avatar.png"),
                        SocialRankingAvatarCircle(
                            "assets/images/avatar_sample/female-avatar.png"),
                        SocialRankingAvatarCircle(
                            "assets/images/avatar_sample/male-avatar.png"),
                        SocialRankingAvatarCircle(
                            "assets/images/avatar_sample/female-avatar.png"),
                        SocialRankingAvatarCircle(
                            "assets/images/avatar_sample/male-avatar.png"),
                        SocialRankingAvatarCircle(
                            "assets/images/avatar_sample/female-avatar.png"),
                        SocialRankingAvatarCircle(
                            "assets/images/avatar_sample/male-avatar.png"),
                        SocialRankingAvatarCircle(
                            "assets/images/avatar_sample/female-avatar.png"),
                        SocialRankingAvatarCircle(
                            "assets/images/avatar_sample/anon-avatar.png"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// 下半顯示各用戶畫面
          Container(
            margin: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 20),
            width: size.width - 40,
            height: size.height - 322,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.5294,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              children: [
                SocialCard('assets/images/bg_test.jpg',
                    'assets/images/avatar_sample/female-avatar.png'),
                SocialCard('assets/images/bg_test.jpg',
                    'assets/images/avatar_sample/male-avatar.png'),
                SocialCard('assets/images/bg_test.jpg',
                    'assets/images/avatar_sample/female-avatar.png'),
                SocialCard('assets/images/bg_test.jpg',
                    'assets/images/avatar_sample/male-avatar.png'),
                SocialCard('assets/images/bg_test.jpg',
                    'assets/images/avatar_sample/female-avatar.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
