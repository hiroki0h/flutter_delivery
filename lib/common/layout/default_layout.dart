import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Color? backgroundColor;
  final Widget child;
  final String? title;
  final Widget? bottomNavigationBar;
  const DefaultLayout(
      {required this.child,
      this.backgroundColor,
      this.title,
      this.bottomNavigationBar,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.white,
      appBar: renderAppBar(),
      body: child,
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  AppBar? renderAppBar() {
    if (title == null) {
      return null;
    } else {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          title!,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        // title: Center(
        //   child: Text(
        //     title!,
        //     style: const TextStyle(
        //       fontSize: 16.0,
        //       fontWeight: FontWeight.w500,
        //       color: Colors.black,
        //     ),
        //   ),
        // ),
        foregroundColor: Colors.black, // 아이콘과 텍스트의 전경 색상
        // automaticallyImplyLeading: false, // 뒤로가기 버튼 제거
        iconTheme: const IconThemeData(
          color: Colors.red, // 뒤로가기 버튼 아이콘 색상
        ),
      );
    }
  }
}
