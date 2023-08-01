import 'package:flutter/material.dart';
import 'package:actual/common/const/colors.dart';
import 'package:actual/common/layout/default_layout.dart';
import 'package:actual/restaurant/view/restaurant_screen.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  // TabController? controller; controller를 쓸 때마다 null 처리를 계속해 줘야 하는 단점
  // 나중에 언젠가는 세팅을 할 것이니 late 추가
  late TabController controller;
  int index = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 4, vsync: this);
    // vsync 파라미터는 무조건 with SingleTickerProviderStateMixin 라고 한 다음에 클래스 넣어주어야함
    controller.addListener(tabListener);
  }

  void tabListener() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);
    super.dispose();
    // 객체가 제거 될 때 변수에 할당 된 메모리를 해제하기 위해
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '코팩 딜리버리',
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: PRIMARY_COLOR,
          unselectedItemColor: BODY_TEXT_COLOR,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          // type: BottomNavigationBarType.shifting, // 클릭된 아이템이 조금 더 크게
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            // setState(() {
            //   this.index = index;
            // }); 해당 인덱스 넣어주기
            controller.animateTo(index);
          },
          currentIndex: index,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fastfood_outlined),
              label: '음식',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_outlined),
              label: '주문',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              label: '프로필',
            ),
          ]),
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(), // 스와이프해서 페이지 안 넘어가게
        controller: controller,
        children: const [
          // Center(child: Text('홈')),
          RestaurantScreen(),
          Center(child: Text('음식')),
          Center(child: Text('주문')),
          Center(child: Text('프로필')),
        ],
      ),
      // child: const Center(
      //   child: Text('Root Tab'),
      // ),
    );
  }
}
