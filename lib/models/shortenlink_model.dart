import 'dart:convert';

class ShortenLinkModel {
  String? url;
  String? shortenUrl;
  String? id;
  String? error;

  ShortenLinkModel(
      {this.id,
        this.url,
        this.shortenUrl
      });
  ShortenLinkModel.withError(String errorMessage) {
    error = errorMessage;
  }
  ShortenLinkModel.fromJson(Map<String, dynamic> json) {

    id = json['code'];
    url = json['original_link'];
    shortenUrl = json['full_short_link'];
  }

  ShortenLinkModel.fromJsonData(Map<String, dynamic> json) {

    id = json['id'];
    url = json['url'];
    shortenUrl = json['shortenUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['Country'] = this.country;
    // data['CountryCode'] = this.countryCode;

    return data;
  }
  static Map<String, dynamic> toMap(ShortenLinkModel link) => {
    'id': link.id,
    'url': link.url,
    'shortenUrl': link.shortenUrl,
  };

  static String encode(List<ShortenLinkModel> links) => json.encode(
    links
        .map<Map<String, dynamic>>((link) => ShortenLinkModel.toMap(link))
        .toList(),
  );

  static List<ShortenLinkModel> decode(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<ShortenLinkModel>((item) => ShortenLinkModel.fromJsonData(item))
          .toList();
}