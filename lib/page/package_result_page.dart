import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reptile/model/package_model.dart';
import 'package:flutter_reptile/page/pub_dev_item_page.dart';
import 'package:translator/translator.dart';

import '../request/api.dart';

class PackageResultPage extends StatefulWidget {
  final String keywords;

  const PackageResultPage({Key? key, required this.keywords}) : super(key: key);

  @override
  PackageResultPageState createState() => PackageResultPageState();
}

class PackageResultPageState extends State<PackageResultPage> {
  List<PackageModel> _packages = [];
  int index = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Api.fetchPackages("q=${widget.keywords}", index, isSearch: true)
        .then((data) {
      setState(() {
        _packages.clear();
        _packages.addAll(data);
        _packages.sort(((a, b) => b.likes.compareTo(a.likes)));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.keywords),
      ),
      body: _packages.isEmpty
          ? const Center(
              child: Text("正在加载数据..."),
            )
          : EasyRefresh(
              header: const ClassicHeader(),
              footer: const CupertinoFooter(),
              onRefresh: () async {
                print('刷新');
              },
              onLoad: () async {
                print('加载更多');
                loadMore();
              },
              child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return PubDevItemPage(packageModel: _packages[index]);
                  },
                  itemCount: _packages.length),
            ),
    );
  }

  loadMore() {
    index++;
    Api.fetchPackages("q=${widget.keywords}", index).then((data) {
      setState(() {
        _packages = [..._packages, ...data];

        _packages.sort(((a, b) => b.likes.compareTo(a.likes)));
      });
    });
  }
}
