import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Accessories_tab_screen.dart';
import 'All_tab_Screen.dart';
import 'Dresses_tab_screen.dart';

class MainTabScreen extends StatefulWidget {

  const MainTabScreen({super.key});

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  TabController? _tabController;
  List<Widget> TabScreem = [
    Alltab(),
    Dressestab(),
    Accessoriestab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Trending Now",
                  style: GoogleFonts.lato(
                    color: Colors.black,
                    fontSize: 28,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TabBar(
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Colors.white,
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xff5F6AFF),
                    ),
                    tabs: [
                      Tab(
                        text: "All",
                      ),
                      Tab(
                        text: "Dresses",
                      ),
                      Tab(
                        text: "Accessories",
                      ),
                    ]),
                Expanded(
                  child: TabBarView(
                    controller:_tabController ,
                    children: TabScreem,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
