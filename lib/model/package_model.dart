class PackageModel {
  //包名
  final String packageName;

  //描述
  final String description;

  //喜欢数
  final int likes;

  //更新日期
  final String lastUpdateTime;

  //地址
  final String packageUrl;

  PackageModel(
    this.packageName,
    this.description,
    this.likes,
    this.lastUpdateTime,
    this.packageUrl,
  );
}
