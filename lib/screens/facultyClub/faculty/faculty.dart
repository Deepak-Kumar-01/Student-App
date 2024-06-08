import 'package:flutter/material.dart';
class Faculty extends StatelessWidget {
  const Faculty({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;

    return  Container(
      height:size.height*0.2 ,
      width: size.width*0.60,

      decoration:BoxDecoration(color: Color(0xFFFFD1E3),borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.black),boxShadow: [BoxShadow (
        color: Color(0xffffd1e3),
        offset: Offset(2.0,2.0),
        blurRadius: 25,
        spreadRadius: 1.0
      )

          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0,10,0,0),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/ASTA7740.JPG'),

                ),
              ),


              Padding(
                padding: const EdgeInsets.fromLTRB(10,6,0,0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bradley Steve',

                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text('@bradsteve',textAlign: TextAlign.start,style: TextStyle(fontSize:10),),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              '15K',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                            Text('Views',style: TextStyle(fontSize: 12),),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '82',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15.0,0,0,0),
                              child: Text('Projects',style: TextStyle(fontSize: 12),),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '1.3M',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15.0,0,0,0),
                              child: Text('Followers',style: TextStyle(fontSize: 12,color: Colors.white),),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height:22,
                          width: 60,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('Follow',style:TextStyle(color: Colors.white,fontSize: 10),textAlign: TextAlign.center,),
                              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black),padding: MaterialStatePropertyAll(EdgeInsets.fromLTRB(5, 4, 5, 5))),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        SizedBox(
                          height: 22,
                          width: 80,
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Text('View profile',style:TextStyle(color: Colors.black,fontSize: 10),textAlign: TextAlign.center,),

                            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white),padding: MaterialStatePropertyAll(EdgeInsets.fromLTRB(5, 4, 5, 5))),


                          ),
                        ),
                      ],
                    ),
                  ],

                ),
              ),
            ],
          ),


        ],
      ),
    );
  }

}
