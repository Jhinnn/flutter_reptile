import 'package:flutter/material.dart';
import 'package:flutter_reptile/model/package_model.dart';
import 'package:flutter_reptile/page/pub_dev_detail_page.dart';

class PubDevItemPage extends StatefulWidget {
  final PackageModel packageModel;
  const PubDevItemPage({Key? key, required this.packageModel})
      : super(key: key);

  @override
  PubDevItemPageState createState() => PubDevItemPageState();
}

class PubDevItemPageState extends State<PubDevItemPage> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) =>
                PubDevDetailPage(packageModel: widget.packageModel)));
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.packageModel.packageName,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Row(
                  children: [
                    const Icon(Icons.star),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      widget.packageModel.likes.toString(),
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
              widget.packageModel.description,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              widget.packageModel.lastUpdateTime,
              style: Theme.of(context).textTheme.titleSmall,
            )
          ],
        ),
      ),
    ));
  }
}
