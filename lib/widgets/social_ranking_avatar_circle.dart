import 'package:flutter/material.dart';

class SocialRankingAvatarCircle extends StatelessWidget {
  var avatarPath;

  SocialRankingAvatarCircle(this.avatarPath);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: CircleAvatar(
        radius: 25,
        backgroundImage:
        AssetImage(avatarPath),
      ),
    );
  }
}
