import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';

class PackageSettingPage extends StatefulWidget {
  const PackageSettingPage({Key? key}) : super(key: key);

  @override
  PackageSettingPageState createState() => PackageSettingPageState();
}

class PackageSettingPageState extends State<PackageSettingPage> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("设置"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              FlutterLogo(
                size: 120,
              ),
            ],
          ),
        ));
  }
}
