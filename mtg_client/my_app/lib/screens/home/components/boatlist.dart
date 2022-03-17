import 'package:flutter/material.dart';

class BoatList extends StatelessWidget {
  //final HomeController controller = Get.put(HomeController());

  // ignore: type_init_formals
  BoatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 16.0, bottom: 12.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text('Bequia'),
                  ),
                  const SizedBox(width: 50.0),
                  InkWell(
                    onTap: () {},
                    child: Text('Canouan'),
                  ),
                  const SizedBox(width: 50.0),
                  InkWell(
                    onTap: () {},
                    child: Text('Union Island'),
                  ),
                  const SizedBox(width: 50.0),
                  InkWell(
                    onTap: () {},
                    child: Text('Mayreau'),
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 400),
              curve: Curves.fastOutSlowIn,
              left: 16.0,
              bottom: 4.0,
              child: Container(
                width: 30.0,
                height: 4.0,
                decoration: ShapeDecoration(
                    shape: StadiumBorder(), color: Color(0xffFCD116)),
              ),
            )
          ],
        )
      ],
    );
  }
}
