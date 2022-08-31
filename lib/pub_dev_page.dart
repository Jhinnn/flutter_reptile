import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reptile/api.dart';
import 'package:flutter_reptile/package_model.dart';
import 'package:translator/translator.dart';

class PubDevPage extends StatefulWidget {
  const PubDevPage({Key? key}) : super(key: key);

  @override
  PubDevPageState createState() => PubDevPageState();
}

class PubDevPageState extends State<PubDevPage> {
  List<PackageModel> _packages = [];
  int index = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Api.fetchPackages("q=dialog", index).then((data) {
      setState(() {
        _packages.clear();
        _packages.addAll(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pub.dev"),
      ),
      body: _packages.isEmpty
          ? const Center(
              child: Text("正在加载数据..."),
            )
          : EasyRefresh(
              onRefresh: () async {
                print('刷新');
              },
              onLoad: () async {
                print('加载更多');
                loadMore();
              },
              child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return packageItem(context, _packages[index]);
                  },
                  itemCount: _packages.length),
            ),
    );
  }

  loadMore() {
    index++;
    Api.fetchPackages("q=dialog", index).then((data) {
      setState(() {
        _packages = [..._packages, ...data];
      });
      
    });
  }
}

Widget packageItem(BuildContext context, PackageModel book) {
  return Card(
      child: Container(
    padding: const EdgeInsets.all(12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              book.packageName,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Row(
              children: [
                const Icon(Icons.star),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  book.likes,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          book.description,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          book.lastUpdateTime,
          style: Theme.of(context).textTheme.titleSmall,
        )
      ],
    ),
  ));
}
