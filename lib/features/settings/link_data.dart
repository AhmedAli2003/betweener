import 'package:flutter/foundation.dart';

@immutable
class LinkData {
  final String title;
  final String link;

  const LinkData({
    required this.link,
    required this.title,
  });

  const LinkData.empty()
      : link = '',
        title = '';
}
