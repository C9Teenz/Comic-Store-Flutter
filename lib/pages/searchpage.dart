import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komik_store/controllers/comic_controller.dart';
import 'package:komik_store/controllers/genre_controller.dart';
import 'package:komik_store/widgets/custom_card_comic.dart';
import 'package:komik_store/widgets/custom_categoru_genre.dart';
import 'package:komik_store/widgets/widget_search.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../themes/theme.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    ComicController comic = Get.find();
    GenreController genre = Get.find();
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const WidgetSearch(),
            Container(
                padding: const EdgeInsets.only(top: 24, bottom: 24),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Obx(() {
                  if (genre.genreData.isEmpty) {
                    return const CircularProgressIndicator();
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: genre.genreData.length,
                      itemBuilder: (context, index) {
                        return CustomCategoryGenre(
                            name: genre.genreData[index].name.toString(),
                            button: () {
                              genre.findGenre(
                                  genre.genreData[index].name.toString());
                              comic.filterGenre();
                            });
                      },
                    );
                  }
                })),
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              width: double.infinity,
              child: Text(
                'Comic List',
                style:
                    primaryTextStyle.copyWith(fontSize: 16, fontWeight: bold),
              ),
            ),
            Expanded(
                child: SizedBox(
              width: double.infinity,
              child: Obx(() {
                if (comic.foundComic.isEmpty && comic.comicData.isEmpty) {
                  return const Center(
                    child: LoadingIndicator(
                        indicatorType: Indicator.ballClipRotatePulse),
                  );
                } else if (comic.foundComic.isNotEmpty) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.5,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemCount: comic.foundComic.length,
                    itemBuilder: (context, index) {
                      return CustomCardComic(
                        creator: comic.foundComic[index].creator,
                        image: comic.foundComic[index].image,
                        name: comic.foundComic[index].name,
                        price: comic.foundComic[index].price,
                        rating: comic.foundComic[index].rating,
                        id: comic.foundComic[index].id,
                        genres: comic.foundComic[index].genres[0].name,
                      );
                    },
                  );
                } else {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.5,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemCount: comic.comicData.length,
                    itemBuilder: (context, index) {
                      return CustomCardComic(
                        creator: comic.comicData[index].creator,
                        image: comic.comicData[index].image,
                        name: comic.comicData[index].name,
                        price: comic.comicData[index].price,
                        rating: comic.comicData[index].rating,
                        id: comic.comicData[index].id,
                        genres: comic.comicData[index].genres[0].name,
                      );
                    },
                  );
                }
              }),
            ))
          ],
        ),
      ),
    );
  }
}
