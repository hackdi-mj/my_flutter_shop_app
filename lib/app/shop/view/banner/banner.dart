import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'controller/banner_controller.dart';

class BuildBanner extends StatefulWidget {
  const BuildBanner({Key? key}) : super(key: key);

  @override
  State<BuildBanner> createState() => _BuildBannerState();
}

class _BuildBannerState extends State<BuildBanner> {
  final CarouselController _controller = CarouselController();
  final BannerController banner = Get.put(BannerController());

  List<Widget> generateImageTiles() {
    return banner.image
        .map(
          (item) => Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  item,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        )
        .toList();
  }

  @override
  void initState() {
    // this is to load random static image
    banner.imageSelected();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: Obx(
          () => Column(
            children: [
              CarouselSlider(
                items: generateImageTiles(),
                options: CarouselOptions(
                    height: 250,
                    viewportFraction: 0.999,
                    enlargeCenterPage: true,
                    pageSnapping: true,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      for (int i = 0; i < generateImageTiles().length; i++) {
                        if (i == index) {
                          banner.boolValues[i] = true;
                        } else {
                          banner.boolValues[i] = false;
                        }
                      }
                    }),
                carouselController: _controller,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < generateImageTiles().length; i++)
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: banner.boolValues[i] ? 35.0 : 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: banner.boolValues[i] ? BoxShape.rectangle : BoxShape.rectangle,
                        borderRadius: banner.boolValues[i] ? const BorderRadius.all(Radius.circular(60)) : null,
                        color: banner.boolValues[i] ? Colors.red : Colors.black.withOpacity(0.1),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      );
}
