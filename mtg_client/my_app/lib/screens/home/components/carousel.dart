import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageCarousel extends StatelessWidget {
  ImageCarousel({
    Key? key,
  }) : super(key: key);

  final List <String> nameList = ['Kingstown Port ', 'Aerial View of Kingstown Port', 'Canouan Port ', 'Union Island Port ', 'Mayreau Port '];

  final List<String> imageList = [
    'https://firebasestorage.googleapis.com/v0/b/mytravelguide-4f370.appspot.com/o/kingstown-st-vincent-port-guide-2.jpg?alt=media&token=24a98539-49cf-4133-9ac4-e80c2e40ee6a',
    'https://firebasestorage.googleapis.com/v0/b/mytravelguide-4f370.appspot.com/o/kingstown_bay.jpg?alt=media&token=f7863877-4fca-45f9-8659-13e67d76c0f3',
    'https://firebasestorage.googleapis.com/v0/b/mytravelguide-4f370.appspot.com/o/Canouan.jpeg?alt=media&token=9c9ce36e-1f96-4b28-a841-894662c8bcd5',
    'https://firebasestorage.googleapis.com/v0/b/mytravelguide-4f370.appspot.com/o/Mayreau.jpeg?alt=media&token=2ea9dff2-25e7-49f7-a287-85f0a3388527',
    'https://firebasestorage.googleapis.com/v0/b/mytravelguide-4f370.appspot.com/o/Union_Island.jpeg?alt=media&token=475b1ed2-6b1b-4819-8e7c-13800a5d622c',
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
        return GestureDetector(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.white,
                    )),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    imageList[i],
                    width: 500,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(nameList[i],
              style: TextStyle(fontSize: 15),),
            ],
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
