import 'package:flutter/material.dart';

class Socities extends StatelessWidget {
  const Socities({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.2,
      width: size.width * 0.60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
      //   gradient: LinearGradient(
      //     colors: [
      //       Color(0xffd973b7),
      //       Color(0xff5656b8)
      //     ]
      // ),

        color: Color(0xff1975D0)
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Column(
          children: [
            SocitiesButton(
              size: size,butnColor1: Colors.black,butnColor2: Colors.white,
            ),
            SocitiesButton(
              size: size,butnColor1: Colors.white,butnColor2: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class SocitiesButton extends StatelessWidget {
  const SocitiesButton({
    super.key,
    required this.size,
    this.butnColor1=Colors.black,
    this.butnColor2=Colors.white,
  });

  final Size size;
  final Color butnColor1;
  final Color butnColor2;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: size.width * 0.26,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.ac_unit,
              color: butnColor2,
              size: 18,
            ),
            label: Text(
              "CODE-ZEN",
              style: TextStyle(
                  color: butnColor2,
                  fontWeight: FontWeight.bold,
                  fontSize: 10),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: butnColor1,
              padding: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ),
        SizedBox(
          width: size.width * 0.26,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.ad_units, color:butnColor1, size: 18),
            label: Text(
              "PUBG-ZEN",
              style: TextStyle(
                  color: butnColor1,
                  fontWeight: FontWeight.bold,
                  fontSize: 10),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: butnColor2,
              padding: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ),
      ],
    );
  }
}
