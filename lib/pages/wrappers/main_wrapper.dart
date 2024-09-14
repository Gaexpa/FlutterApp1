import 'package:flutter/material.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  /// 當下頁面index
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
      ),
      // _pages[_selectedIndex],

      /// 畫面下方三個選項
      bottomNavigationBar: BottomNavigationBar(
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
        },

        /// 各圖標
        items: [
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 0
                ? Icons.home
                : Icons.home_outlined),
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
                ? Icons.sensor_occupied
                : Icons.sensor_occupied_outlined),

            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 4
                ? Icons.book
                : Icons.book_outlined),
            label: '',
          ),
        ],
      ),
    );
  }
}
