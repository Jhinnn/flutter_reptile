import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reptile/model/package_model.dart';
import 'package:flutter_reptile/page/pub_dev_item_page.dart';

import '../request/api.dart';

class PackageSearchPage extends StatefulWidget {
  const PackageSearchPage({Key? key}) : super(key: key);

  @override
  PackageSearchPageState createState() => PackageSearchPageState();
}

class PackageSearchPageState extends State<PackageSearchPage> {
  List<PackageModel> _packages = [];
  int index = 1;
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("搜索"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onSubmitted: (v) {
                  Api.fetchPackages("q=$v", index, isSearch: true).then((data) {
                    setState(() {
                      _packages.clear();
                      _packages.addAll(data);
                      _packages.sort(((a, b) => b.likes.compareTo(a.likes)));
                    });
                  });
                },
              ),
            ),
            Expanded(
              child: EasyRefresh(
                header: const ClassicHeader(),
                footer: const CupertinoFooter(),
                onRefresh: () async {
                  print('刷新');
                },
                onLoad: () async {
                  print('加载更多');
                  // loadMore();
                },
                child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return PubDevItemPage(packageModel: _packages[index]);
                    },
                    itemCount: _packages.length),
              ),
            )
          ],
        ));
  }
}
