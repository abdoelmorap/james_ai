class ImageModel {
  String? sType;
  int? totalCount;
  List<Value>? value;

  ImageModel({this.sType, this.totalCount, this.value});

  ImageModel.fromJson(Map<String, dynamic> json) {
    sType = json['_type'];
    totalCount = json['totalCount'];
    if (json['value'] != null) {
      value = <Value>[];
      json['value'].forEach((v) {
        value!.add(new Value.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_type'] = this.sType;
    data['totalCount'] = this.totalCount;
    if (this.value != null) {
      data['value'] = this.value!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Value {
  String? url;
  int? height;
  int? width;
  String? thumbnail;
  int? thumbnailHeight;
  int? thumbnailWidth;
  Null? base64Encoding;
  String? name;
  String? title;
  Provider? provider;
  String? imageWebSearchUrl;
  String? webpageUrl;

  Value(
      {this.url,
        this.height,
        this.width,
        this.thumbnail,
        this.thumbnailHeight,
        this.thumbnailWidth,
        this.base64Encoding,
        this.name,
        this.title,
        this.provider,
        this.imageWebSearchUrl,
        this.webpageUrl});

  Value.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    height = json['height'];
    width = json['width'];
    thumbnail = json['thumbnail'];
    thumbnailHeight = json['thumbnailHeight'];
    thumbnailWidth = json['thumbnailWidth'];
    base64Encoding = json['base64Encoding'];
    name = json['name'];
    title = json['title'];
    provider = json['provider'] != null
        ? new Provider.fromJson(json['provider'])
        : null;
    imageWebSearchUrl = json['imageWebSearchUrl'];
    webpageUrl = json['webpageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['height'] = this.height;
    data['width'] = this.width;
    data['thumbnail'] = this.thumbnail;
    data['thumbnailHeight'] = this.thumbnailHeight;
    data['thumbnailWidth'] = this.thumbnailWidth;
    data['base64Encoding'] = this.base64Encoding;
    data['name'] = this.name;
    data['title'] = this.title;
    if (this.provider != null) {
      data['provider'] = this.provider!.toJson();
    }
    data['imageWebSearchUrl'] = this.imageWebSearchUrl;
    data['webpageUrl'] = this.webpageUrl;
    return data;
  }
}

class Provider {
  String? name;
  String? favIcon;
  String? favIconBase64Encoding;

  Provider({this.name, this.favIcon, this.favIconBase64Encoding});

  Provider.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    favIcon = json['favIcon'];
    favIconBase64Encoding = json['favIconBase64Encoding'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['favIcon'] = this.favIcon;
    data['favIconBase64Encoding'] = this.favIconBase64Encoding;
    return data;
  }
}
