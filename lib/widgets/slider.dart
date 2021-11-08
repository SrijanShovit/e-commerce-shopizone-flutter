import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:flutter/material.dart';

class CSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: Caorousel.length,
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 0.84,
        enlargeCenterPage: true,
      ),
      itemBuilder: (BuildContext context, int index, int page) {
        return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    Caorousel[index].images,
                    fit: BoxFit.fitHeight,
                  ),
                  // child: Image(
                  //   //CachedNetworkImageProvider is used so that once url is fetched using internet, it gets stored in cache and no need of internet then

                  //   image:
                  //       CachedNetworkImageProvider(Caorousel[index].images),
                ),
                Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black54.withOpacity(0.3),
                    ),
                    height: double.infinity,
                    child: Center(
                      child: Text(
                        Caorousel[index].text,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ))
              ],
            ));
      },
    );
  }
}
