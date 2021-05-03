import '../../models/banner_model.dart';
import '../../models/collection_items_model.dart';
import '../../models/promo_model.dart';

abstract class MainRepositoryInterface {
  Future<bool> mainResponse();
  List<PromoModel> findPromos();
  List<CollectionItemsModel> findCollectionItems();
  List<BannerModel> findBanners();
}
