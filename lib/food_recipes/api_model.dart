class Model {
  String? image, url, source;
  String? label;
  Model({this.image, this.url, this.source, this.label});

  Model.fromJson(Map json)
      :image=json["image"],
        url=json["url"],
        source=json["source"],
        label=json["label"];
}