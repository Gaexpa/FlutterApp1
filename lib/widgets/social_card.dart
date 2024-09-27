import 'package:flutter/material.dart';

class SocialCard extends StatelessWidget {
  var bgPath;
  var avatarPath;

  SocialCard(this.bgPath, this.avatarPath);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      height: 330,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 3, color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          /// 背景
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(11),
              child: Image.asset(
                bgPath,
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// 頭像
          Positioned(
            left: 10,
            top: 10,
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(avatarPath),
            ),
          ),
        ],
      ),
    );
  }
}
