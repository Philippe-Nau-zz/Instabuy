import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:instabuy_testinho/data/repository/interface/main_repositoryInterface.dart';
import '../models/banner_model.dart';
import '../models/collection_items_model.dart';
import '../models/promo_model.dart';

class MainRepository implements MainRepositoryInterface {
  final String _baseUrl = 'https://api.instabuy.com.br/apiv3';
  final RxMap data = {}.obs;

  var dio = Dio();

  Future<bool> mainResponse() async {
    try {
      final response = await dio.get<Map>(
        '$_baseUrl/layout',
        queryParameters: {'subdomain': 'bigboxdelivery'},
      );
      if (response.statusCode == 200) {
        data.value = response.data;
        if (data['status'] == 'success') {
          findPromos();
          findCollectionItems();
          findBanners();
          return true;
        }
      }
      return false;
    } on DioError catch (e) {
      print(e);
      rethrow;
    }
  }

  List<PromoModel> findPromos() {
    try {
      List<dynamic> _dataPromos = data['data']['promo'];
      return _dataPromos.map<PromoModel>((e) => PromoModel.fromMap(e)).toList();
    } on DioError catch (e) {
      print(e);
      rethrow;
    }
  }

  List<CollectionItemsModel> findCollectionItems() {
    try {
      List<dynamic> _dataCollectionItems = data['data']['collection_items'];
      return _dataCollectionItems
          .map<CollectionItemsModel>((e) => CollectionItemsModel.fromMap(e))
          .toList();
    } on DioError catch (e) {
      print(e);
      rethrow;
    }
  }

  List<BannerModel> findBanners() {
    try {
      List<dynamic> _dataBanners = data['data']['banners'];
      return _dataBanners
          .map<BannerModel>((e) => BannerModel.fromMap(e))
          .toList();
    } on DioError catch (e) {
      print(e);
      rethrow;
    }
  }
}
