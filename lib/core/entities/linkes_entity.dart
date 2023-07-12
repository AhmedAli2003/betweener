class LinksEntity {
  final List<String> links;
  final String title;
  final String link;
  final String username;

  const LinksEntity({
    required this.links,
    required this.title,
    required this.link,
    required this.username,
  });

  //  const LinksEntity.empty({
  //   this. links='' ,
  //   this.title = '',
  //   this.link = '',
  //   this.username = '',

  // });


  @override
  String toString() {
    return 'LinksEntity(links: $links, title: $title, link: $link, username: $username)';
  }
}
