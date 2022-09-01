import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reptile/model/package_model.dart';
import 'package:flutter_reptile/page/most_like_page.dart';
import 'package:flutter_reptile/page/package_column_page.dart';
import 'package:flutter_reptile/page/package_search_page.dart';
import 'package:flutter_reptile/page/package_setting_page.dart';
import 'package:flutter_reptile/page/pub_dev_item_page.dart';
import 'package:translator/translator.dart';

import 'request/api.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int index = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            onTap: (i) {
              setState(() {
                index = i;
              });
            },
            currentIndex: index,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                activeIcon: Icon(
                  Icons.home,
                ),
                label: '首页',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.cloud,
                ),
                activeIcon: Icon(
                  Icons.cloud,
                ),
                label: '栏目',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
                activeIcon: Icon(
                  Icons.search,
                ),
                label: '搜索',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                activeIcon: Icon(
                  Icons.settings,
                ),
                label: '设置',
              ),
            ]),
        body: IndexedStack(
          index: index,
          children: const [
            MostLikePackagePage(),
            PackageColumnPage(),
            PackageSearchPage(),
            PackageSettingPage()
          ],
        ));
  }
}
