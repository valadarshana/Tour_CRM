import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:card_swiper/card_swiper.dart';


class HotelList extends StatefulWidget{
  const HotelList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>HotelListState();
}

class HotelListState extends State<HotelList>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 270,
      width: 200,
      child: Card(
        color: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    "https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg",
                    fit: BoxFit.cover,
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemWidth: 200.0,
                itemHeight: 100.0,
                layout: SwiperLayout.TINDER,

              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      SizedBox(
                          width: MediaQuery.of(context).size.width*0.40,
                          child: const Text('New York Art new me nn',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,letterSpacing: 1),overflow: TextOverflow.ellipsis,)),
                      const Icon(Icons.more_vert,color: Colors.grey,),
                    ],
                  ),
                  const SizedBox(height: 3,),
                  Row(
                    children: [
                      const Text('\$967',style: TextStyle(color: Colors.grey,fontSize: 12),),
                      const SizedBox(width: 10,),
                      SvgPicture.asset(
                        "assets/svg/circle.svg",
                        color: const Color(0xFFADB4BD),
                        //color:global.pageIndex==0?Theme.of(context).primaryColor:const Color(0xFFADB4BD),
                        semanticsLabel: 'No post',
                        width: 5,
                        height: 5,
                      ),
                      const SizedBox(width: 10,),
                      const Text('257 Km away',style: TextStyle(color: Colors.grey,fontSize: 12),),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      const Icon(Icons.wb_sunny_outlined,size: 30,color: Colors.grey,),
                      const SizedBox(width: 5,),
                      Column(
                        children: const [
                          Text('26\u00B0',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                          Text('Sunny',style: TextStyle(fontSize: 15,color: Colors.grey),),
                        ],
                      ),
                      const SizedBox(width: 5,),
                      Expanded(
                        child: Column(
                          children: [
                            const SizedBox(
                                width: 140,
                                child: Divider(color: Colors.grey,thickness: 2,)),
                            const SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  children: const [
                                    Icon(Icons.favorite_outline_rounded,size: 18,color: Colors.grey,),
                                    SizedBox(width: 3,),
                                    Text('4k',style: TextStyle(fontSize: 12,color: Colors.black54),),
                                  ],
                                ),
                                const SizedBox(width: 10,),
                                Row(
                                  children: const [
                                    Icon(Icons.message,size: 18,color: Colors.grey,),
                                    SizedBox(width: 3,),
                                    Text('766',style: TextStyle(fontSize: 12,color: Colors.black54),),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}