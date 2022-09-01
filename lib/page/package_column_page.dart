import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reptile/constants/app_colors.dart';
import 'package:flutter_reptile/page/package_result_page.dart';

class PackageColumnPage extends StatefulWidget {
  const PackageColumnPage({Key? key}) : super(key: key);

  @override
  PackageColumnPageState createState() => PackageColumnPageState();
}

class PackageColumnPageState extends State<PackageColumnPage> {
  final Map<String, List<String>> _item = {
    '组件': [
      // 'animation',
      'button',
      'calendar',
      'drawing',
      'dialog',
      'gesture',
      'listView',
      'picker',
      'popup',
      'progress',
      'scrollView',
      'segment',
      'switch',
    ],
    '工具': ['launcher', 'compress', 'provider', 'networking'],
    '系统': [
      'system',
      'window',
      'file',
    ],
  };

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("栏目"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _item.values.map((e) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _item.keys.first,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Wrap(
                          runSpacing: 8,
                          spacing: 8,
                          children: e.map((e) => columnItem(e)).toList(),
                        )
                      ],
                    ),
                  );
                }).toList()),
          )),
    );
  }

  Widget columnItem(String title) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => PackageResultPage(keywords: title))),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.themeColor),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
