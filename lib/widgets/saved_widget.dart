import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SavedWidget extends StatefulWidget{
  const SavedWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>SavedWidgetState();
}

class SavedWidgetState extends State<SavedWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 15,
      color: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Stack(
        children: [
          Container(
            height: 250,
           // margin: const EdgeInsets.only(top: 20),
            decoration:  const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                    image: AssetImage(
                        "assets/images/img1.jpg",
                    ),
                    fit: BoxFit.cover,
                ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(colors: [Colors.black.withOpacity(0.7),Colors.black.withOpacity(0.3),Colors.black.withOpacity(0.0),],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      SizedBox(
                          width: MediaQuery.of(context).size.width*0.70,
                          child: const Text('New York Art new me nn',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white,letterSpacing: 1),overflow: TextOverflow.ellipsis,)),
                      const Icon(Icons.more_vert,color: Colors.white,),
                    ],
                  ),
                  const SizedBox(height: 3,),
                  Row(
                    children: [
                      const Text('\$967',style: TextStyle(color: Colors.white,fontSize: 12),),
                      const SizedBox(width: 10,),
                      SvgPicture.asset(
                        "assets/svg/circle.svg",
                        color: Colors.white,
                        //color:global.pageIndex==0?Theme.of(context).primaryColor:const Color(0xFFADB4BD),
                        semanticsLabel: 'No post',
                        width: 5,
                        height: 5,
                      ),
                      const SizedBox(width: 10,),
                      const Text('257 Km away',style: TextStyle(color: Colors.white,fontSize: 12),),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      const Icon(Icons.wb_sunny_outlined,size: 30,color: Colors.white,),
                      const SizedBox(width: 5,),
                      Column(
                        children: const [
                          Text('26\u00B0',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                          Text('Sunny',style: TextStyle(fontSize: 15,color: Colors.white),),
                        ],
                      ),
                      const SizedBox(width: 5,),
                      Expanded(
                        child: Column(
                          children: [
                            const SizedBox(
                                //width: 140,
                                child: Divider(color: Colors.white,thickness: 2,)),
                            const SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  children: const [
                                    Icon(Icons.favorite_outline_rounded,size: 18,color: Colors.white,),
                                    SizedBox(width: 3,),
                                    Text('4k',style: TextStyle(fontSize: 12,color: Colors.white),),
                                  ],
                                ),
                                const SizedBox(width: 10,),
                                Row(
                                  children: const [
                                    Icon(Icons.message,size: 18,color: Colors.white,),
                                    SizedBox(width: 3,),
                                    Text('766',style: TextStyle(fontSize: 12,color: Colors.white),),
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
          ),
        ],
      ),
    );
  }

}