import 'package:flutter/foundation.dart';

@immutable
class LinkData {
  final String title;
  final String link;

  const LinkData({
    required this.title,
    required this.link,
  });

  const LinkData.empty()
      : link = '',
        title = '';

  @override
  String toString() => 'LinkData(title: $title, link: $link)';

  @override
  bool operator ==(covariant LinkData other) {
    if (identical(this, other)) return true;

    return other.title == title && other.link == link;
  }

  @override
  int get hashCode => Object.hash(title, link);
}
