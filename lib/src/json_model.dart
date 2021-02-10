import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:test_app_gallery/src/values.dart';

part 'json_model.g.dart';

@JsonSerializable()
class User {
  final name;
  User({this.name});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Urls {
  final full;
  final thumb;
  Urls({this.full, this.thumb});
  factory Urls.fromJson(Map<String, dynamic> json) => _$UrlsFromJson(json);

  Map<String, dynamic> toJson() => _$UrlsToJson(this);
}

@JsonSerializable()
class SomeImage {
  final id;
  final alt_description;
  Urls urls;
  User user;

  SomeImage({this.id, this.alt_description, this.urls, this.user});

  factory SomeImage.fromJson(Map<String, dynamic> json) =>
      _$SomeImageFromJson(json);

  Map<String, dynamic> toJson() => _$SomeImageToJson(this);
}

@JsonSerializable()
class SomeImageList {
  List<SomeImage> someImageList;

  SomeImageList({this.someImageList});

  factory SomeImageList.fromJson(json) => _$SomeImageListFromJson(json);

  Map<String, dynamic> toJson() => _$SomeImageListToJson(this);
}

Future<SomeImageList> getImagesList() async {
  const String url = urlApi;

  final responce = await http.get(url);

  if (responce.statusCode == 200) {
    return SomeImageList.fromJson(json.decode(responce.body));
  } else {
    throw Exception('Error: ${responce.reasonPhrase}');
  }
}
