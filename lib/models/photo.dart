class Photo {
  String url;
  String photographer;
  String photographerUrl;
  int photographerId;
  Src src;
  Photo(
      {required this.url,
      required this.photographer,
      required this.photographerUrl,
      required this.photographerId,
      required this.src});

  factory Photo.fromJson(Map<String, dynamic> json) {
    Src srcModel = Src.fromJson(json["src"]);
    return Photo(
        url: json["url"],
        photographer: json["photographer"] ?? "Unknown",
        photographerUrl: json["photographer_url"],
        photographerId: json["photographer_id"] ?? 0,
        src: srcModel);
  }
}

class Src {
  String portrait;
  String large;
  String landscape;
  String medium;

  Src(
      {required this.portrait,
      required this.large,
      required this.landscape,
      required this.medium});

  factory Src.fromJson(Map<String, dynamic> json) {
    return Src(
        portrait: json["portrait"],
        large: json["large"],
        landscape: json["landscape"],
        medium: json["medium"]);
  }
}
