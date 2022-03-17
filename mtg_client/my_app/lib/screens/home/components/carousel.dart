import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageCarousel extends StatelessWidget {
  ImageCarousel({Key? key}) : super(key: key);

  final List<String> imageList = [
    "https://www.telegraph.co.uk/content/dam/Travel/Destinations/Caribbean/StVincentGrenadadines/kingstown-st-vincent-port-guide-2.jpg",
    'https://img.marinas.com/v2/c23db371789f065ab2935dbf2a57d9779ed6a6ced13d178125be215fbcea6947.jpg',
    'https://cdn.pixabay.com/photo/2019/11/25/18/24/st-4652732_960_720.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: imageList.length,
      options: CarouselOptions(
        enlargeCenterPage: true,
        height: 300,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        reverse: false,
        aspectRatio: 5.0,
      ),
      itemBuilder: (context, i, id) {
        //for onTap to redirect to another screen
        return GestureDetector(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.white,
                )),
            //ClipRRect for image border radius
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imageList[i],
                width: 500,
                fit: BoxFit.cover,
              ),
            ),
          ),
          onTap: () {
            var url = imageList[i];
            print(url.toString());
          },
        );
      },
    );
  }
}
