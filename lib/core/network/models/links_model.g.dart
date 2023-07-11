// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
      (json['links'] as List<dynamic>).map((e) => e as String).toList(),
      json['title'] as String,
      json['link'] as String,
      json['username'] as String,
    );

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'links': instance.links,
      'title': instance.title,
      'link': instance.link,
      'username': instance.username,
    };
