// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    name: json['name'],
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
    };

Urls _$UrlsFromJson(Map<String, dynamic> json) {
  return Urls(
    full: json['full'],
    thumb: json['thumb'],
  );
}

Map<String, dynamic> _$UrlsToJson(Urls instance) => <String, dynamic>{
      'full': instance.full,
      'thumb': instance.thumb,
    };

SomeImage _$SomeImageFromJson(Map<String, dynamic> json) {
  return SomeImage(
    id: json['id'],
    alt_description: json['alt_description'],
    urls: json['urls'] == null
        ? null
        : Urls.fromJson(json['urls'] as Map<String, dynamic>),
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SomeImageToJson(SomeImage instance) => <String, dynamic>{
      'id': instance.id,
      'alt_description': instance.alt_description,
      'urls': instance.urls,
      'user': instance.user,
    };

SomeImageList _$SomeImageListFromJson(dynamic json) {
  return SomeImageList(
    someImageList: (json as List)
        ?.map((e) =>
            e == null ? null : SomeImage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SomeImageListToJson(SomeImageList instance) =>
    <String, dynamic>{
      'someImageList': instance.someImageList,
    };
