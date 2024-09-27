import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  /// 當下頁面index
  int _selectedIndex = 0;

  /// 怎麼跳其他頁的方法
  void _goToBranch(int index) {
    widget.navigationShell.goBranch(index,
        initialLocation: index == widget.navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: widget.navigationShell,
      ),
      // _pages[_selectedIndex],

      /// 畫面下方三個選項
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomNavigationBar(
          /// 固定間距
          type: BottomNavigationBarType.fixed,

          /// 置中
          showSelectedLabels: false,
          showUnselectedLabels: false,

          /// 頁面切換
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
            _goToBranch(_selectedIndex);
          },

          /// 各圖標
          items: [
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 0 ? Icons.home : Icons.home_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 1 ? Icons.pets : Icons.pets_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 2
                  ? Icons.camera_alt
                  : Icons.camera_alt_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 3
                  ? Icons.people_alt
                  : Icons.people_alt_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 4 ? Icons.book : Icons.book_outlined),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
