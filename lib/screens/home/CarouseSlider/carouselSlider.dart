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
          return Center(
            child: SingleChildScrollView(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: AlertDialog(
                  insetPadding: EdgeInsets.only(
                      top: 1, bottom: 20, left: 20, right: 20),
                  titlePadding: EdgeInsets.all(0),
                  contentTextStyle:
                      TextStyle(fontSize: 15, color: Colors.black),
                  contentPadding:
                      EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
                  actionsPadding: EdgeInsets.only(bottom: 18, top: 10),
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
                          // height: 111,
                          // decoration: BoxDecoration(
                          //     color: Colors.red,
                          //     borderRadius: BorderRadius.only(
                          //         topRight: Radius.circular(11),
                          //         topLeft: Radius.circular(11))),
                          child: Image.asset(
                            // images[selectedIndex],
                            eventDetails[selectedIndex]["eventImage"]!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 11, bottom: 0),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2, right: 2),
                                    child: Icon(Icons.watch_later_outlined, size: 12,),
                                  ),
                                  Text(
                                    eventDateAndTime,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.location_on_outlined, size: 16,),
                                  Text(
                                    eventLocation,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
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
                        child: Text("Register", style: TextStyle(color: Colors.white),),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue
                      ),

                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Close")
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

//=================Carousel Items=====================
    List<Widget> carouselItems = eventDetails.map(
      (eventData) {
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
              bottom: 15,
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
                      eventData["eventImage"]!,
                      // carouselImage,
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
                            Color(0x00000000),
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
          backgroundColor: isActive ? Colors.blue[500] : Colors.grey[350],
          // backgroundColor: isActive ? Colors.grey[600] : Colors.grey[300],
        ),
      );
    }

    List<Widget> dotList() {
      List<Widget> list = [];
      for (int i = 0; i < eventDetails.length; i++) {
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
                ) ,
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: dotList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
