import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:komik_store/controllers/auth_controller.dart';
import 'package:komik_store/controllers/comic_controller.dart';
import 'package:komik_store/themes/theme.dart';
import 'package:komik_store/widgets/custom_banner.dart';
import 'package:komik_store/widgets/custom_card_Home_comic.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final comic = Get.find<ComicController>();
    final user = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
              width: double.infinity,
              color: kWhiteColor,
              child: Column(
                children: [
                  Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Hello, ${user.userData.value.name.toString()}",
                            style: primaryTextStyle.copyWith(
                                fontSize: 20, fontWeight: semiBold),
                          ),
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: const DecorationImage(
                                    image: AssetImage('assets/profil.png'))),
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        CustomBanner(image: "assets/banner1.png"),
                        CustomBanner(image: "assets/banner2.png"),
                        CustomBanner(image: "assets/banner3.jpg"),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
              width: double.infinity,
              color: kWhiteColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // ignore: unnecessary_string_escapes
                    "Staff Pick\'s",
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: bold),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                      height: 319,
                      width: double.infinity,
                      child: Obx(
                        () => comic.comicByRating.isEmpty
                            ? const Center(
                                child: Text('Belum ada data'),
                              )
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: (context, index) =>
                                    CustomCardComicH(
                                        id: comic.comicData[index].id,
                                        image: comic.comicData[index].image,
                                        name: comic.comicData[index].name,
                                        creator: comic.comicData[index].creator,
                                        rating: comic.comicData[index].rating,
                                        price: comic.comicData[index].price)),
                      )),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
              width: double.infinity,
              color: kWhiteColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Popular Comics",
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: bold),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                      height: 319,
                      width: double.infinity,
                      child: Obx(
                        () => comic.comicByRating.isEmpty
                            ? const Center(
                                child: Text('Belum ada data'),
                              )
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: comic.comicByRating.length,
                                itemBuilder: (context, index) =>
                                    CustomCardComicH(
                                        id: comic.comicByRating[index].id,
                                        image: comic.comicByRating[index].image,
                                        name: comic.comicByRating[index].name,
                                        creator:
                                            comic.comicByRating[index].creator,
                                        rating:
                                            comic.comicByRating[index].rating,
                                        price:
                                            comic.comicByRating[index].price)),
                      )),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
