import 'package:get/get.dart';
import 'package:instabuy_testinho/data/repository/interface/main_repositoryInterface.dart';

import '../data/models/banner_model.dart';
import '../data/models/collection_items_model.dart';
import '../data/models/promo_model.dart';
import '../views/home.dart';
import '../views/home.dart';

class MainController extends GetxController with StateMixin {
  final MainRepositoryInterface _mainRepository;
  MainController(this._mainRepository);

  void onInit() {
    super.onInit();
    findStatus();
  }

  Future findStatus() async {
    change([], status: RxStatus.loading());
    try {
      final data = await _mainRepository.mainResponse();
      change(data, status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error());
    }
  }

  List<PromoModel> findPromos() {
    return _mainRepository.findPromos();
  }

  List<CollectionItemsModel> findCollectionItems() {
    return _mainRepository.findCollectionItems();
  }

  List<BannerModel> findBanners() {
    List<BannerModel> _listBanners;
    _listBanners = _mainRepository.findBanners();
    if (GetPlatform.isMobile) {
      _listBanners.removeWhere((element) => element.isDesktop);
      return _listBanners;
    } else {
      _listBanners.removeWhere((element) => element.isMobile);
      return _listBanners;
    }
  }
}
