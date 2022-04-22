import 'package:flutter/material.dart';
import 'package:my_app/screens/home/components/carousel.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: ImageCarousel(),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: Text(
                    'St. Vincent and the Grenadines consist of 32 islands, 9 of which are inhabited.'
                    'However, of the 9 inhabited, 5 of them frequently require boat-based transportation. '
                    'The main and largest island, St. Vincent, provides necessities for the people of the Grenadine Islands. '
                    'As a result, boat-based transportation is critical for these essential products to reach the people of the Grenadines.'
                    'The image carousel depicts some of the different ports located in St. Vincent and the Grenadines.',
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 20,
                      height: 1.5,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}