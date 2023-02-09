import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:komik_store/Models/genremodel.dart';

class GenreController extends GetxController {
  RxList<Genremodel> genreData = <Genremodel>[].obs;
  var genreName = ''.obs;
  // List<Genremodel>genres=
  var dio = Dio();
  String url = 'http://10.0.2.2:8000/genres';

  @override
  void onInit() {
    getGenre();
    super.onInit();
  }

  Future<List<Genremodel>> getGenre() async {
    try {
      var result = await dio.get(url);
      final List data = result.data;
      genreData.value = data.map((e) => Genremodel.fromJson(e)).toList();

      return genreData;
    } catch (e) {
      throw Exception(e);
    }
  }

  void findGenre(String name) {
    for (var element in genreData) {
      if (element.name == name) {
        genreName.value = element.name;
      }
    }
  }
}
