class BannerModel {
  String id;
  String href;
  String image;
  String title;
  bool isMobile;
  bool isDesktop;

  BannerModel({
    this.id,
    this.href,
    this.image,
    this.title,
    this.isMobile,
    this.isDesktop,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'href': href,
      'image': image,
      'title': title,
      'is_mobile': isMobile,
      'is_desktop': isDesktop,
    };
  }

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    final String _baseUrlBanners =
        'https://assets.instabuy.com.br/ib.store.banner/bnr-';
    return BannerModel(
      id: map['id'],
      href: map['href'],
      image: _baseUrlBanners + map['image'],
      title: map['title'],
      isMobile: map['is_mobile'],
      isDesktop: map['is_desktop'],
    );
  }
}
