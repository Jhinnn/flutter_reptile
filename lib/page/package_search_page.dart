import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';

class PackageSearchPage extends StatefulWidget {
  const PackageSearchPage({Key? key}) : super(key: key);

  @override
  PackageSearchPageState createState() => PackageSearchPageState();
}

class PackageSearchPageState extends State<PackageSearchPage> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("搜索"),
        ),
        body: const Center(
          child: Text("正在加载数据..."),
        ));
  }
}
