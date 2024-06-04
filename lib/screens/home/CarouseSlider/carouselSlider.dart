import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:studentapp/screens/home/CarouseSlider/carouselSlider_API.dart';

class CarouselSlider extends StatefulWidget {
  const CarouselSlider({super.key});

  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  final PageController _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.75 // to see portion of slider on left and right side
      );

  int currentPage = 0;
  late Timer? carouselTimer;
  int selectedIndex = 0;

  //=========== generating pages ==============
  Timer getTimer() {
    return Timer.periodic(Duration(milliseconds: 4000), (timer) {
      if (currentPage < images.length - 1) {
        currentPage++;
        // currentPage = (currentPage + 1) % images.length;
      } else {
        currentPage = 0;
      }
      _pageController.animateToPage(currentPage,
          duration: Duration(milliseconds: 1500), curve: Curves.easeInOut);
    });
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

    var eventDateAndTime = selectedIndex > eventDetails.length - 1
        ? "Null"
        : eventDetails[selectedIndex]["eventDateAndTime"]!;
    var eventLocation = selectedIndex > eventDetails.length - 1
        ? "Null"
        : eventDetails[selectedIndex]["eventLocation"]!;
    var eventTitle = selectedIndex > eventDetails.length - 1
        ? "Null"
        : eventDetails[selectedIndex]["eventTitle"]!;
    var eventDescription = selectedIndex > eventDetails.length - 1
        ? "Null"
        : eventDetails[selectedIndex]["eventDescription"]!;
    var eventLink = selectedIndex > eventDetails.length - 1
        ? "Null"
        : eventDetails[selectedIndex]["eventLink"]!;

//================= Show POPUP function =====================

    void showPOPUP() {
      showDialog(
        barrierColor: Color(0x88000000),
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   // width: double.infinity,
              //   height: 100,
              //   decoration: BoxDecoration(
              //       color: Colors.green,
              //       borderRadius: BorderRadius.only(
              //           topRight: Radius.circular(11),
              //           topLeft: Radius.circular(11))),
              // ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: AlertDialog(
                  titlePadding: EdgeInsets.all(0),
                  contentPadding:
                  EdgeInsets.only(top: 0, bottom: 8, left: 20, right: 20),
                  shape: RoundedRectangleBorder(
                    // borderRadius: BorderRadius.only(
                    //     bottomRight: Radius.circular(11),
                    //     bottomLeft: Radius.circular(11)
                    // ),
                      borderRadius: BorderRadius.all(Radius.circular(11))),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                          topLeft: Radius.circular(11),
                          topRight: Radius.circular(11),
                        ),
                        child: Container(
                          // width: double.infinity,
                          height: 111,
                          // decoration: BoxDecoration(
                          //     color: Colors.red,
                          //     borderRadius: BorderRadius.only(
                          //         topRight: Radius.circular(11),
                          //         topLeft: Radius.circular(11))),
                          child: Expanded(
                            child: AspectRatio(
                              aspectRatio: 9 / 2,
                              child: Image.asset(
                                images[selectedIndex],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 11, bottom: 8),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                eventDateAndTime,
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                eventLocation,
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(eventTitle),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  content: Text(
                    eventDescription,
                    style: TextStyle(fontSize: 17),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          print("$eventLink clicked...");
                        },
                        child: Text("Register")),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Close"))
                  ],
                  insetPadding: EdgeInsets.only(top: 0, left: 20, right: 20),
                ),
              ),
            ],
          );
        },
      );
    }

//=================Carousel Items=====================
    List<Widget> carouselItems = images.map(
      (carouselImage) {
        return GestureDetector(
          onTap: () {
            // ScaffoldMessenger.of(context)
            //     .showSnackBar(SnackBar(content: Text("index: $carouselImage")));
            showPOPUP();
          },
          onPanDown: (details) {
            carouselTimer?.cancel();
            carouselTimer = null;
          },
          onPanCancel: () {
            carouselTimer = getTimer();
          },
          child: Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
              top: 11,
              bottom: 25,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(11),
              child: Container(
                height: 150,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  // borderRadius: BorderRadius.circular(111),
                ),
                child: Stack(children: [
                  Container(
                    color: Colors.blue,
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset(
                      // "assets/images/coding.jpg",
                      carouselImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      // color: Colors.grey[500],
                      gradient: LinearGradient(
                          colors: [
                            // Color(0xff24e02d),
                            // Colors.black,
                            Color(0xdb000000),
                            Color(0x0),
                          ],
                          stops: [
                            0.3,
                            0.99
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter),
                      // borderRadius: BorderRadius.circular(11)
                    ),
                  ),

                        //================= Title and Details =====================
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        // color: Colors.green,
                        height: 85,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                // "FLUTTER",
                                eventTitle,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  // "Details",
                                  eventDescription,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  // softWrap: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ]),
              ),
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
            borderRadius: BorderRadius.circular(50)),
        child: CircleAvatar(
          radius: 3.5,
          backgroundColor: isActive ? Colors.grey[600] : Colors.grey[300],
        ),
      );
    }

    List<Widget> dotList() {
      List<Widget> list = [];
      for (int i = 0; i < images.length; i++) {
        list.add(i == selectedIndex ? dot(true) : dot(false));
      }
      return list;
    }

//=================================
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Container(
            height: 170,
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
                  left: MediaQuery.of(context).size.width * 0.42,
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
