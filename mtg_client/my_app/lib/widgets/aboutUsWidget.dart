import 'package:flutter/material.dart';

class AboutUsWidget extends StatelessWidget {
  final String imageSade;
  final String imageChantel;
  final String imageJared;

  AboutUsWidget({
    Key? key,
    this.imageSade =
        'https://firebasestorage.googleapis.com/v0/b/mytravelguide-4f370.appspot.com/o/sade.jpg?alt=media&token=041ace29-0165-47b8-a49a-78bd335243f3',
    this.imageChantel =
        'https://firebasestorage.googleapis.com/v0/b/mytravelguide-4f370.appspot.com/o/chantel.jpg?alt=media&token=fc5e23f6-1025-420a-8ed9-d1697151ecf2',
    this.imageJared =
        'https://firebasestorage.googleapis.com/v0/b/mytravelguide-4f370.appspot.com/o/jared.jpg?alt=media&token=fcf4fb6e-d0d6-4b3f-b168-e8caf9e2c5b7',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              buildImage1(),
              Text(
                'Sade´ Audain',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          Column(
            children: [
              buildImage2(),
              Text(
                'Chantel Lewis',
                style: TextStyle(fontSize: 14),
              )
            ],
          ),
          Column(
            children: [
              buildImage3(),
              Text(
                'Jared Hamid',
                style: TextStyle(fontSize: 14),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildImage1() {
    final image1 = NetworkImage(imageSade);

    return Row(
      children: [
        ClipOval(
          child: Material(
            color: Colors.transparent,
            child: Ink.image(
              image: image1,
              fit: BoxFit.cover,
              width: 110,
              height: 110,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildImage2() {
    final image2 = NetworkImage(imageChantel);

    return Row(
      children: [
        ClipOval(
          child: Material(
            color: Colors.transparent,
            child: Ink.image(
              image: image2,
              fit: BoxFit.cover,
              width: 110,
              height: 110,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildImage3() {
    final image3 = NetworkImage(imageJared);

    return Row(
      children: [
        ClipOval(
          child: Material(
            color: Colors.transparent,
            child: Ink.image(
              image: image3,
              fit: BoxFit.cover,
              width: 110,
              height: 110,
            ),
          ),
        ),
      ],
    );
  }
}
