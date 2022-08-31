import 'package:html/parser.dart';
import 'package:translator/translator.dart';
import 'package_model.dart';
import 'http_request.dart';

class Api {
  static Future<List<PackageModel>> fetchPackages(
      String pubName, int page) async {
    List<PackageModel> books = [];
    try {
      //获取到整个网页的代码数据
      var response = await DioFactory.getString(pubName, page);
      var document = parse(response); //将String 转换为document对象
      var content = document
          .querySelector(".packages"); //找到标签中librarylist的节点，类选择器节点的查找前面要加个.
      var lefts = content!.querySelectorAll(".packages-item"); //找到所有pt-ll-l节点

      for (int i = 0; i < lefts.length; i++) {
        if (lefts[i].querySelector(".packages-score-value-number") != null ||
            lefts[i].querySelector(".-x-ago") != null) {
          String title =
              lefts[i].querySelector(".packages-title")!.text.toString();
          var description =
              lefts[i].querySelector(".packages-description")!.text.toString();

          // final translator = GoogleTranslator();
          // Translation descriptioncn =
          //     await translator.translate(description, to: 'zh-cn');
          String likeNumber = lefts[i]
              .querySelector(".packages-score-value-number")!
              .nodes
              .first
              .text
              .toString();
        

          String xago =
              lefts[i].querySelector(".-x-ago")!.nodes.first.text.toString();
        

          PackageModel packageModel = PackageModel(title, description,
              likeNumber, xago, '${Config.baseUrl}/$title');

          books.add(packageModel);
        }
      }
      return books;
    } catch (e) {
      print(e);
    }

    return books;
  }
}
