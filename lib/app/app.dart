import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../component/common_headings.dart';
import 'common_navigation_icon_bar.dart';
import 'common_page_view.dart';
import 'shop/view/shop_view.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final PageController _pageController = PageController(initialPage: 2);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marketpedia',
      home: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          title: CommonHeadings(
            title: 'Marketpedia',
            style: CommonHeadings.styleOpenSans.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/notification.png'),
            ),
          ],
        ),
        body: PageView(
          controller: _pageController,
          children: const [
            CommonPageView(
              color: Colors.yellow,
              title: 'Shop Page',
            ),
            CommonPageView(
              color: Colors.red,
              title: 'Search Page',
            ),
            ShopView(),
            CommonPageView(
              color: Colors.blue,
              title: 'History Page',
            ),
            CommonPageView(
              color: Colors.yellow,
              title: 'Profile Page',
            ),
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 2,
          items: const [
            CommonNavigationIconBar(
              icon: Icons.home,
              title: 'Home',
            ),
            CommonNavigationIconBar(
              icon: Icons.search,
              title: 'Search',
            ),
            CommonNavigationIconBar(
              icon: Icons.shopping_cart,
            ),
            CommonNavigationIconBar(
              icon: Icons.history,
              title: 'History',
            ),
            CommonNavigationIconBar(
              icon: Icons.person,
              title: 'Profile',
            ),
          ],
          color: Colors.black,
          buttonBackgroundColor: Colors.black,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          // Change the value to true to activate the navigation bar.
          // and setup ur onTap function
          letIndexChange: (index) => false,
        ),
      ),
    );
  }
}
