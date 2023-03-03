import 'package:dio/dio.dart';

import 'package:get/get.dart';
import 'package:komik_store/Models/comicmodel.dart';
import 'package:komik_store/controllers/cart_controller.dart';
import 'package:komik_store/controllers/genre_controller.dart';

class ComicController extends GetxController {
  GenreController genre = Get.find();
  CartController cart = Get.find();
  var isLoading = true.obs;
  var comicData = <ComicModel>[].obs;
  var comicByRating = <ComicModel>[].obs;
  var foundComic = <ComicModel>[].obs;
  final url = 'http://10.0.2.2:8000/comics/';

  @override
  void onInit() {
    getComic();
    getComicByRating();

    super.onInit();
  }

  var dio = Dio();
  Future<List<ComicModel>> getComic() async {
    isLoading(true);
    try {
      var result = await dio.get(url);
      final List data = result.data['data'];
      isLoading(false);
      comicData.value = data.map((e) => ComicModel.fromJson(e)).toList();

      return comicData;
    } catch (e) {
      throw Exception(e);
    }
  }

  ComicModel getUserByID(int id) {
    return comicData.firstWhere((element) => element.id == id);
  }

  Future<List<ComicModel>> getComicByRating() async {
    try {
      var result = await dio.get(url);
      final List data = result.data['data'];
      List<ComicModel> datacomic =
          data.map((e) => ComicModel.fromJson(e)).toList();
      comicByRating.value = datacomic.where((p0) => p0.rating == 5.0).toList();
      return comicByRating;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> editStockComic() async {
    try {
      if (cart.temporaryData.isNotEmpty) {
        for (var element in cart.temporaryData) {
          var response = await dio.put('${url}editstock/${element.comics.id}',
              data: {'stock': element.comics.stock - element.quantity});
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  void filterName(String nameComic) {
    List<ComicModel> results = [];

    if (nameComic.isEmpty) {
      results = comicData;
    } else {
      results = comicData
          .where((e) =>
              e.name.toString().toLowerCase().contains(nameComic.toLowerCase()))
          .toList();
    }
    foundComic.value = results;
  }

  void filterGenre() {
    List<ComicModel> results = [];

    if (genre.genreName.isEmpty) {
      results = comicData;
    } else {
      results = comicData
          .where((e) =>
              e.genres[0].name.toString().toLowerCase() ==
              genre.genreName.toLowerCase())
          .toList();
    }
    foundComic.value = results;
  }
}
