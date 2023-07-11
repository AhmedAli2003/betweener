import 'package:json_annotation/json_annotation.dart';

part 'links_model.g.dart';

@JsonSerializable()
class Links {
  final List<String> links;
  final String title;
  final String link;
  final String username;
  final int isActive = 0;

  const Links(this.links, this.title, this.link, this.username);

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}
