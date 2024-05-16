import 'dart:async';
import 'package:flutter/material.dart';
import 'package:studentapp/screens/home/CarouseSlider/carouselSlider_Image.dart';


class CarouselSlider extends StatefulWidget {
  const CarouselSlider({super.key});

  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {

  final PageController _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.75  // to see portion of slider on left and right side
  );

  int currentPage = 0;
  late Timer? carouselTimer;
  int selectedIndex = 0;

  Timer getTimer() {
    return Timer.periodic( Duration(milliseconds: 4000), (timer) {
      if (currentPage < images.length-1) {
        currentPage++;
        // currentPage = (currentPage + 1) % images.length;
      }
      else {
        currentPage = 0;
      }
      _pageController.animateToPage(
          currentPage,
          duration:  Duration(milliseconds: 1500),
          curve: Curves.easeIn
      );
    }
    );
  }

  @override
  void initState() {
    super.initState();
    carouselTimer = getTimer();
  }

  @override
  void dispose() {
    carouselTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

//=================Carousel Items=====================
    List<Widget> carouselItems = images.map(
          (carouselImage) {
        return GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("index: $carouselImage"))
            );
          },
          onPanDown: (details) {
            carouselTimer?.cancel();
            carouselTimer = null;
          },
          onPanCancel: () {
            carouselTimer = getTimer();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 8,right: 8,top: 11, bottom: 25,),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(11),
              child: Container(
                height: 100,
                color: Colors.grey[300],
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: AspectRatio(
                        aspectRatio: 1 / 2,
                        child: Image.asset(
                          carouselImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Events Details",
                          textAlign: TextAlign.center, // Adjust text alignment as needed
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // child: Container(
              //   height: 100,
              //   color: Colors.grey[300],
              //   child: Row(
              //     children: [
              //       Image.asset(
              //         carouselImage,
              //         fit: BoxFit.cover,
              //       ),
              //       Text("data")
              //     ],
              //   ),
              // ),

            ),
          ),
        );
      },
    ).toList();

//------------------Dot Widget-------------------
    Widget dot(bool isActive) {
      return Container(
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(50)
        ),
        child: CircleAvatar(
          radius: 3.5,
          backgroundColor: isActive ? Colors.grey[600] : Colors.grey[300],
        ),
      );
    }


    List<Widget> dotList() {
      List<Widget> list = [];
      for(int i=0; i<images.length; i++) {
          list.add(i==selectedIndex ? dot(true) : dot(false));
      }
      return list;
    }

//=================================
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
          children: [
            Container(
              height: 150,
              child: Stack(
                children: [

                  PageView(
                    controller: _pageController,
                    children: carouselItems,
                    onPageChanged: (int page) {
                      setState(() {
                        selectedIndex = page;
                      });
                    },
                  ),

                  Positioned(
                    bottom: 5,
                    left: MediaQuery.of(context).size.width*0.42,
                    child: Row(
                      children: dotList(),
                    ),
                  )
                ],
              ),
            ),
          ],

      ),
    );
  }
}