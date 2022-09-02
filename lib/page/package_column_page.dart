import 'package:flutter/material.dart';
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
      'text',
      'button',
      'calendar',
      'drawing',
      'dialog',
      'textfield'
      'gesture',
      'listView',
      'picker',
      'popup',
      'image'
      'progress',
      'scrollView',
      'segment',
      'switch',
    ],
    '工具': [
      'loading',
      'launcher',
      'compress',
      'provider',
      'networking',
      'validator',
      'date_format'
          'qr',
      'pinyin'
    ],
    '系统': [
      'system',
      'window',
      'file',
      'image_picker',
      'camera',
      'photo',
      'address book',
      'map',
      'permission',
      'path',
    ],
    '其他': [
      'log',
      'provider',
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
                children: _item.keys.map((e) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          runSpacing: 4,
                          spacing: 8,
                          children: (_item[e] as List)
                              .map((e) => columnItem(e))
                              .toList(),
                        )
                      ],
                    ),
                  );
                }).toList()),
          )),
    );
  }

  Widget columnItem(String title) {
    return TextButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => PackageResultPage(keywords: title))),
        child: Text(
          title,
          // style: Theme.of(context).textTheme.labelMedium,
        ));
  }
}
