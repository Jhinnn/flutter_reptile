import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_reptile/model/package_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PubDevDetailPage extends StatefulWidget {
  final PackageModel packageModel;
  const PubDevDetailPage({Key? key, required this.packageModel})
      : super(key: key);

  @override
  PubDevDetailPageState createState() => PubDevDetailPageState();
}

class PubDevDetailPageState extends State<PubDevDetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.packageModel.packageName),
        ),
        body: WebView(
          initialUrl: widget.packageModel.packageUrl,
        ));
  }
}
